$(function () {
  // 生成する文字列の長さ
  var l = 8;
  // 生成する文字列に含める文字セット
  var c = "abcdefghijklmnopqrstuvwxyz0123456789";
  var cl = c.length;

  $("#button").click(function () {
    var r = "";
    for (var i = 0; i < l; i++) {
      r += c[Math.floor(Math.random() * cl)];
    }
    $('#rand').val(r)
  })
})
