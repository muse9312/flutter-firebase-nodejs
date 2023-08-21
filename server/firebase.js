// Import the functions you need from the SDKs you need
import { initializeApp } from "firebase/app";
import { getAnalytics } from "firebase/analytics";
// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
// For Firebase JS SDK v7.20.0 and later, measurementId is optional



const firebaseConfig = {
    apiKey: "AIzaSyDPeD_zoJJHT7Fyz5A_2BBeS6OTnALbpQU",
    authDomain: "flutter-nodejs-firebase.firebaseapp.com",
    projectId: "flutter-nodejs-firebase",
    storageBucket: "flutter-nodejs-firebase.appspot.com",
    messagingSenderId: "453599960187",
    appId: "1:453599960187:web:e540589e57dcc48adc96de",
    measurementId: "G-DNX8BNXN2D"
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);
const analytics = getAnalytics(app);
let database = firebase.database()