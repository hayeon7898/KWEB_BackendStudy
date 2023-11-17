// node chapter6_index로 실행

// Code 6-1.
const util = require('util');
const crypto = require('crypto');
const pbkdf2 = util.promisify(crypto.pbkdf2);
const encrypt = async text => {
    const ALGO = 'sha512';
    const KEY_LEN = 64;
    const digest = await pbkdf2(text, '', 1, KEY_LEN, ALGO);
    console.log(`${text} | ${digest.toString('base64')}`);
};
(async () => await encrypt('samplepassword'))();

(async () => {
    await encrypt('samplepasswordsamplepasswordsamplepasswordsamplepasswordsample');
    await encrypt('samplepasswordsamplepastwordsamplepasswordsamplepasswordsample');
})() 


/*Code 6-4*/
/*
const encrypt = async text => {
    const ALGO = 'sha512';
    const KEY_LEN = 64;
    const salt = await randomBytes(32);
    const iter = Math.floor(Math.random() * 20000) + 200000;
    const digest = await pbkdf2(text, salt, iter, KEY_LEN, ALGO);
    console.log(`${text} | ${iter} | ${digest.toString('base64')}`);
};   
*/


/*Code 6-5*/

const generatePassword = async password => {
    const ALGO = 'sha512';
    const KEY_LEN = 64;
    const salt = await randomBytes(32);
    const iter = Math.floor(Math.random() * 20000) + 200000;
    const digest = await pbkdf2(password, salt, iter, KEY_LEN, ALGO);
    return `${ALGO}:${salt.toString(
    'base64',
    )}:${iter}:${KEY_LEN}:${digest.toString('base64')}`;
};


/*Code 6-6*/
const verifyPassword = async (password, hashedPassword) => {
    const [algo, encodedSalt, iterStr, keyLenStr, encodedDigest] =
    hashedPassword.split(':');
    const salt = Buffer.from(encodedSalt, 'base64');
    const iter = parseInt(iterStr, 10);
    const keyLen = parseInt(keyLenStr, 10);
    const storedDigest = Buffer.from(encodedDigest, 'base64');
    const digest = await pbkdf2(password, salt, iter, keyLen, algo);
    return Buffer.compare(digest, storedDigest) === 0;
};

(async () => {
    const hashedPassword = await generatePassword('password');
    const result1 = await verifyPassword('password', hashedPassword);
    const result2 = await verifyPassword('passsword', hashedPassword);
    console.log(`hashed: ${hashedPassword}`);
    console.log(`password: ${result1} / passsword: ${result2}`);
})();
    