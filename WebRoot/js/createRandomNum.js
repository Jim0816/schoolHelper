var code; //在全局 定义验证码   
function createCode() {
    code = "";
    var codeLength = 6;//验证码的长度   
    //var checkCode = document.getElementById("checkCode");
    var codes = document.getElementById("code");
    var selectChar = new Array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9,'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z');//所有候选组成验证码的字符，当然也可以用中文的   
   
    for (var i = 0; i < codeLength; i++) {
        var charIndex = Math.floor(Math.random() * 36);
        code += selectChar[charIndex];
    }
    //alert(code);
    codes.innerHTML = code;
}
   
function validate() {
    var inputCode = document.getElementById("inputCode").value.toUpperCase();
    var inputCodeSpan = document.getElementById("inputCodeSpan");
    if (inputCode.length <= 0) {
    	inputCodeSpan.style.borderColor='red';
    } else if (inputCode != code) {
    	inputCodeSpan.style.borderColor='red';
    createCode();//刷新验证码   
    } else {
    	inputCodeSpan.style.borderColor='gray';
    }
}