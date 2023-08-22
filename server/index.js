const express = require('express');
const cors = require('cors');
const admin = require('firebase-admin');
const app = express();

admin.initializeApp({ // 초기화
    credential: admin.credential.cert('./firebase-adminsdk.json'), // firebase 자격증명
    // dataaaseURL: "https://YOUR_FIREBASE_PROJECT_ID.firebaseio.com"
});

app.use(express.json());
app.use(cors());


// 로그인
app.post('/login', (req, res) => {
    const { email, password } = req.body;

    // Firebase 인증을 사용하여 로그인 시도
    admin.auth().getUserByEmail(email)
        .then(user => {
            if (user.password == password) {

                res.json({ success: true, message: "로그인 성공" });
                console.log(res.json);
            } else {
                res.json({ success: false, message: "비밀번호가 틀립니다." });
            }
        })
        .catch(error => {
            res.json({ success: false, message: "로그인 실패: " + error.message });
        });
});

// 회원가입
app.post('/signup', async (req, res) => {

    const { email, password } = req.body;

    const userRespance = await admin.auth().createUser({
        email: email,
        password: password,
    })
    res.json(userRespance);

})

app.listen(8080, () => {
    console.log('Express server is running on port 8080');
});