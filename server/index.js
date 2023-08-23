const express = require('express');
const cors = require('cors');
const admin = require('firebase-admin');
const app = express();
const axios = require('axios');
require('dotenv').config();



admin.initializeApp({ // 초기화
    credential: admin.credential.cert('/Users/majestyharia/study/flutter_example/flutter-firebase-nodejs/server/firebase-adminsdk.json'), // firebase 자격증명

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
                console.log(res);

            } else {
                res.json({ success: false, message: "비밀번호가 틀립니다." });
            }
            console.log("응답 데이터: ", res);

        })
        .catch(error => {
            res.json({ success: false, message: "로그인 실패: " + error.message });
        });
});

// 회원가입
app.post('/signup', async (req, res) => {
    console.log(req);

    const { email, password } = req.body;

    const userRespance = await admin.auth().createUser({
        email: email,
        password: password,
    })
    console.log(userRespance);
    res.json(userRespance);


})


app.get('/kakaoath', async (req, res) => {

    const authCode = req.query.code;
    console.log(authCode);

    try {
        const data = {
            code: authCode,
            grant_type: 'authorization_code',
            client_id: process.env.KAKAO_REST_API_KEY,
            redirect_uri: process.env.KAKAO_REDIRECT_URI
        };
        console.log(data);
        const response = await axios.post(
            'https://kauth.kakao.com/oauth/token', data,
            {
                headers: {
                    'Content-type': 'application/x-www-form-urlencoded;charset=utf-8'
                },
            }
        );
        console.log(response);
        const token = response.data.access_token;
        res.json({ token });

    } catch (error) {
        console.log(error);
    }
});






app.listen(8080, () => {
    console.log('Express server is running on port 8080');
});