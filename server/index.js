const express = require('express');
const admin = require('firebase-admin');
const cors = require('cors');
const app = express();

admin.initializeApp({ // 초기화
    credential: admin.credential.cert('./firebase-adminsdk.json'), // firebase 자격증명
    // dataaaseURL: "https://YOUR_FIREBASE_PROJECT_ID.firebaseio.com"
});

app.use(express.json());
app.use(cors());

app.post('/signup', async (req, res) => {

    const { email, password } = req.body;

    const userRespance = await admin.auth().createUser({
        email: email,
        password: password,
    })
    res.json(userRespance);

})

// app.post('/signup', async (req, res) => {
//     const { email, password} = req.body;

//     try {
//       const userRecord = await admin.auth().createUser({
//         email: email,
//         password: password,
//       });

//       const userData = {
//         email: email,
//         carNumber: carNumber,
//       };

//       await admin.firestore().collection('users').doc(userRecord.uid).set(userData);

//       res.json({ success: true, message: '회원가입이 완료되었습니다.' });
//     } catch(error) {
//       res.status(400).json({ success: false, message: error.message });
//     }
//   });


app.post('/login', (req, res) => {
    const { email, password } = req.body;

    // Firebase 인증을 사용하여 로그인 시도
    admin.auth().getUserByEmail(email)
        .then(user => {
            if (user.password == password) {
                res.json({ success: true, message: "로그인 성공" });
            } else {
                res.json({ success: false, message: "비밀번호가 틀립니다." });
            }
        })
        .catch(error => {
            res.json({ success: false, message: "로그인 실패: " + error.message });
        });
});

app.listen(8080, () => {
    console.log('Express server is running on port 8080');
});