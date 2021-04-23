// 자식창 팝업
function insertPopup() {
    
    const url = "http://localhost:8088/books/board/bc_board/secret";
    const title = "secret-form";
    const status = "left=500px, top=100px, width=500px, height=300px";

    // window.open
    open("", title, status);

    frmData.target = title; // form 전송하는 윈도우를 설정
    frmData.action = url;// idCheck.jsp라는 새창에서 처리하므로 url지정
    frmData.method = "POST";
    // form 전송하기
    frmData.submit();
    
    // window.open("about:blank").close();
}