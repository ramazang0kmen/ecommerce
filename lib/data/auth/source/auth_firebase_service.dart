import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce/data/auth/model/user_creation_req.dart';
import 'package:ecommerce/data/auth/model/user_signin_req.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthFirebaseService {
  Future<Either> signUp(UserCreationReq user);
  Future<Either> signIn(UserSigninReq user);
  Future<Either> sendPasswordResetEmail(String email);
  Future<Either> getAges();
  Future<bool> isLoggedIn();
  Future<Either> getUser();
}

class AuthFirebaseServiceImpl implements AuthFirebaseService {
  @override
  Future<Either> signUp(UserCreationReq user) async {
    try {
      var returnedData =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: user.email!,
        password: user.password!,
      );

      FirebaseFirestore.instance
          .collection('Users')
          .doc(returnedData.user!.uid)
          .set(
        {
          'firstName': user.firstName,
          'lastName': user.lastName,
          'email': user.email,
          'gender': user.gender,
          'age': user.age,
        },
      );

      return const Right('Sign up was succesful.');
    } on FirebaseAuthException catch (e) {
      String message = '';

      if (e.code == 'weak-password') {
        message = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        message = 'The account already exists for that email.';
      }

      return Left(message);
    }
  }

  @override
  Future<Either> getAges() async {
    try {
      var returnData =
          await FirebaseFirestore.instance.collection('Ages').get();

      return Right(returnData.docs);
    } catch (e) {
      return const Left('Please try again later.');
    }
  }

  @override
  Future<Either> signIn(UserSigninReq user) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: user.email!,
        password: user.password!,
      );

      return const Right('Sign in was succesful.');
    } on FirebaseAuthException catch (e) {
      String message = '';

      if (e.code == 'invalid-email') {
        message = 'Not user found for thaht email.';
      } else if (e.code == 'invalid-credential') {
        message = 'Wrong password provided for that user.';
      }

      return Left(message);
    }
  }

  @override
  Future<Either> sendPasswordResetEmail(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return const Right('Password reset email was sent.');
    } catch (e) {
      return const Left('Please try again later.');
    }
  }

  @override
  Future<bool> isLoggedIn() async {
    var currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<Either> getUser() async {
    try {
      var currentUser = FirebaseAuth.instance.currentUser;
      var userData = await FirebaseFirestore.instance
          .collection('Users')
          .doc(currentUser!.uid)
          .get()
          .then((value) => value.data());

      userData!['userId'] = currentUser.uid;
      return Right(userData);
    } catch (e) {
      return const Left('Please try again later.');
    }
  }
}
