// HTMLの読み込みが完了したときに、以下の処理を実行する
document.addEventListener("DOMContentLoaded", function() {
    // header.htmlの内容を取得して、指定した場所に挿入する
    fetch('header.html')
        .then(response => response.text()) // 取得した内容をテキストとして解釈
        .then(data => {
            // id="header-placeholder" の要素に、取得したHTMLデータを埋め込む
            document.getElementById('header-placeholder').innerHTML = data;
        });
});