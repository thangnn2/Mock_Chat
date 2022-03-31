import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationRepo {
  FirebaseAuth? firebaseAuth = FirebaseAuth.instance;

  Future<UserCredential?> signIn({String? email, String? password}) async {
    try {
      UserCredential? userCredential = await firebaseAuth
          ?.signInWithEmailAndPassword(
        email: email!,
        password: password!,
      );
      return userCredential;
    }
    on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
    return null;
  }


  Future<UserCredential?> signUp({String? email, String? password}) async {
    try {
      UserCredential? userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email!, password: password!);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    }
    return null;
  }

  Future<bool> isSignIn() async {
    User? user = firebaseAuth?.currentUser;
    return user!=null;
  }

  Future<List<void>> signOut() async {
    return Future.wait([
      firebaseAuth!.signOut(),
    ]);
  }

  Future<User?> getUser() async {
    return firebaseAuth?.currentUser;
  }
}
