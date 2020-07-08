function({ })
// 生成する文字列の長さ
var LENGTH = 8;

// 生成する文字列に含める文字セット
var WORDS = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";

var generateRandomStr = function () {
  var r = "";
  for (var i = 0; i < LENGTH; i++) {
    r += WORDS[Math.floor(Math.random() * WORDS.length)];
  }
  return r;
}
