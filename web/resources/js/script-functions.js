function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}

function MM_showHideLayers() { //v3.0
  var i,p,v,obj,args=MM_showHideLayers.arguments;
  for (i=0; i<(args.length-2); i+=3) if ((obj=MM_findObj(args[i]))!=null) { v=args[i+2];
    if (obj.style) { obj=obj.style; v=(v=='show')?'visible':(v='hide')?'hidden':v; }
    obj.visibility=v; }
}

//------------------ �α��� CHECK FORM --------------
function LoginFrm(theForm) 
{
	if(typeof(theForm.boan)=="object"){
		if (theForm.boan.checked) {
			var url = "https://old.kafm.or.kr:8158/login.php";
			theForm.action = url;
		}
	}

	if (theForm.id.value == "") {
		window.alert("���̵� �Է��Ͻʽÿ�.");
		theForm.id.focus();
		return false;
	}
	if (theForm.pwd.value == "") {
		window.alert("��й�ȣ�� �Է��Ͻʽÿ�.");
		theForm.pwd.focus();
		return false;
	}
}

//----------------------- ��â ����(��ũ�ѹ� ��) ----------------------------
function Win_scroll(theURL,wide,high,resize) {
	var now = new Date();
	var hour = now.getHours();
	var minute = now.getMinutes();
	var second = now.getSeconds();
	var PopName = ""+hour + minute + second;

	if (!resize) var resize = 'no';
	var window_left = (screen.width-640)/2;
	var window_top = (screen.height-480)/2;
	window.open(theURL,PopName,'width='+wide+',height='+high+',scrollbars=yes,resizable=' + resize + ',top=' + window_top + ',left=' + window_left + '');
}

function Win_pop(theURL,wide,high) {
	var window_left = (screen.width-640)/2;
	var window_top = (screen.height-480)/2;
	window.open(theURL,"Newwin",'width='+wide+',height='+high+',scrollbars=yes,resizable=no,top=' + window_top + ',left=' + window_left + '');
}

//----------------------- ��â ����(��ũ�ѹ� ��) ----------------------------
function Win_mu(theURL,wide,high) {
	var window_left = (screen.width-640)/2;
	var window_top = (screen.height-480)/2;
	window.open(theURL,"Newwin",'width='+wide+',height='+high+',scrollbars=no,resizable=no,top=' + window_top + ',left=' + window_left + '');
}

//----------------------- �˻� ----------------------------
function Search_send(theForm)
{
	if(theForm.keyword.value == "")
	{
		alert("�˻�� �Է��ϼ���.");
		theForm.keyword.focus();
		return false;
	}
}

//------------------ ������ư CHECK --------------
function radioCheck(oN){
	for(i=0;i<oN.length;i++){
		if(oN[i].checked){ return true; }
	}
	return false;
}

//-----------------------E-mail �ּ�Ȯ��----------------------------
function isEmail(str) {
	// 2013-07-09 Rain ����
	var reg = /^[A-Za-z0-9_\-]+([.][A-Za-z0-9_\-]+)*[@][A-Za-z0-9_\-]+([.][A-Za-z0-9_\-]+)+$/;
	if (reg.test(str) == true) {
		return true;
	} else {
		return false;
	}
//	var supported = 0;
//	if (window.RegExp) {
//		var tempStr = "a";
//		var tempReg = new RegExp(tempStr);
//		if (tempReg.test(tempStr)) supported = 1;
//	}
//	if (!supported) return (str.indexOf(".") > 2) && (str.indexOf("@") > 0);
//	var r1 = new RegExp("(@.*@)|(\\.\\.)|(@\\.)|(^\\.)");
//	var r2 = new RegExp("^.+\\@(\\[?)[a-zA-Z0-9\\-\\.]+\\.([a-zA-Z]{2,3}|[0-9]{1,3})(\\]?)$");
//	return (!r1.test(str) && r2.test(str));
}

//----------------------- ���� Ȯ�� ----------------------------
function Check_Num(theForm) {
	t = theForm.value ;
	for(i=0;i<t.length;i++) {
		if (t.charAt(i)<'0' || t.charAt(i)>'9') {
			alert("���ڸ� �Է����ּ���.") ;
			theForm.value="";
			theForm.focus();
			return false ;
		}
	}
	return true;
}

//----------------------- ���� Ȯ��(�ڸ��� ����) ----------------------------
function Check_Tel(theForm,mm) {
	t = theForm.value;

	for(i=0;i<t.length;i++) {
		if (t.charAt(i)<'0' || t.charAt(i)>'9') {
			alert("���ڸ� �Է����ּ���.") ;
			theForm.value="";
			theForm.focus() ;
			return false ;
		}
	}
	if (t.length < mm)
	{
		alert("������ ���̸� Ȯ���Ͻʽÿ�.");
		theForm.focus();
		return false;
	}
	return true;
}	

//------------------------ �����ȣ�˻� ----------------------------
function OpenZipcode(z){    //open zip code check win
	var window_left = (screen.width-640)/2;
	var window_top = (screen.height-480)/2;
	zName = "/abstract/zipcode.html?zip_gubun="+z
	window.open(zName,"ZipWin",'width=466,height=175,scrollbars=yes,top=' + window_top + ',left=' + window_left + '');
}

//------------------------ �����ȣ�˻� ----------------------------
function goDoro_Zipsearch(z){    //open zip code check win
	var window_left = (screen.width-640)/2;
	var window_top = (screen.height-480)/2;
	zName = "/abstract/zip_Doro_search.html?zip_gubun="+z
	window.open(zName,"ZipWin",'width=466,height=250,scrollbars=yes,top=' + window_top + ',left=' + window_left + '');
}

//------------------------ �����ȣ�˻� ----------------------------
function goDoro_Zipsearch_daum(z){    //open zip code check win
	var window_left = (screen.width-640)/2;
	var window_top = (screen.height-480)/2;
	zName = "/abstract/zip_Doro_search_daum.html?zip_gubun="+z
	window.open(zName,"ZipWin",'width=466,height=250,scrollbars=yes,top=' + window_top + ',left=' + window_left + '');
}

//------------------------ �����ȣ�˻� ----------------------------
function OpenZipcode_m(z){    //open zip code check win
	var window_left = (screen.width-640)/2;
	var window_top = (screen.height-480)/2;
	zName = "/zipcode.html?zip_gubun="+z
	window.open(zName,"ZipWin",'width=468,height=175,scrollbars=yes,top=' + window_top + ',left=' + window_left + '');
}

//------------------------ �����ȣ�˻� ----------------------------
function OpenZipcode_ml(z){    //open zip code check win
	var window_left = (screen.width-640)/2;
	var window_top = (screen.height-480)/2;
	zName = "/community/research/zipcode.html?zip_gubun=" + z + "&zip_gubun2=in"
	window.open(zName,"ZipWin",'width=468,height=175,scrollbars=yes,top=' + window_top + ',left=' + window_left + '');
}

//------------------------ �����ȣ�˻� ----------------------------
function OpenZipcode_out(z){    //open zip code check win
	var window_left = (screen.width-640)/2;
	var window_top = (screen.height-480)/2;
	zName = "/community/research/zipcode.html?zip_gubun=" + z + "&zip_gubun2=out"
	window.open(zName,"ZipWin",'width=468,height=175,scrollbars=yes,top=' + window_top + ',left=' + window_left + '');
}


//------------------------ �����˻� ----------------------------
function OpenHosp(z){
	var window_left = (screen.width-640)/2;
	var window_top = (screen.height-480)/2;
	murl = "/abstract/hosp_search.html?field="+z
	window.open(murl,"HosWin",'width=466,height=175,scrollbars=yes,top=' + window_top + ',left=' + window_left + '');
}

//------------------------ �����˻� ----------------------------
function OpenHosprecord(z){
	var window_left = (screen.width-640)/2;
	var window_top = (screen.height-480)/2;
	murl = "/p_system/search_hosp_record.html?field="+z
	window.open(murl,"HosWin",'width=600,height=200,scrollbars=yes,top=' + window_top + ',left=' + window_left + '');
}


//------------------------ ���� �Է� ----------------------------
function OpenPhoto(str){
	var window_left = (screen.width-640)/2;
	var window_top = (screen.height-480)/2;
	murl = "/photo_up.html?num="+str;
	window.open(murl,"PhoWin",'width=441,height=256,top=' + window_top + ',left=' + window_left + '');
}

//------------------------ �������� PopUp ----------------------------
function OpenNotify(murl){
	var window_left = (screen.width-640)/2;
	var window_top = (screen.height-480)/2;
	window.open(murl,"NoticeWin",'width=529,height=365,scrollbars=yes,top=' + window_top + ',left=' + window_left + '');
}

//------------------------ �Ƿ�贺�� PopUp ----------------------------
function OpenNews(murl){
	var window_left = (screen.width-640)/2;
	var window_top = (screen.height-480)/2;
	window.open(murl,"NewsWin",'width=529,height=345,scrollbars=yes,top=' + window_top + ',left=' + window_left + '');
}

//------------------------ ������� PopUp ----------------------------
function OpenEvent(murl){
	var window_left = (screen.width-640)/2;
	var window_top = (screen.height-480)/2;
	window.open(murl,"NewsWin",'width=529,height=345,scrollbars=yes,top=' + window_top + ',left=' + window_left + '');
}

//------------------------ ���� ----------------------------
function delconf(murl) 
{
	if(confirm("���� �����Ͻðڽ��ϱ�?"))
	window.location.href = murl;
}

function AlbumDel(murl) 
{
	if(confirm("������ �̹����鵵 ��� �������� �˴ϴ�. \n\n ���� �����Ͻðڽ��ϱ�?"))
	window.location = murl;
}
//---------------------- ���� popup -------------
function Memo_open(myurl){
	var window_left = (screen.width-640)/2;
	var window_top = (screen.height-480)/2;
	window.open (myurl, "memo", 'width=416, height=315,scrollbars=yes,top=' + window_top + ',left=' + window_left + '')
}

//---------------------- ���� -------------
function Memo_wasteconf(murl){
	if(confirm("���� �����Ͻðڽ��ϱ�?\n\n������� �̵��˴ϴ�."))
	window.location = murl;
}

//---------------------- ���� -------------
function Memo_delconf(murl){
	if(confirm("���� �����Ͻðڽ��ϱ�?\n\n������ ������ ������ �����˴ϴ�."))
	window.location = murl;
}

//---------------------- ���� -------------
function Sender_delconf(murl){
	if(confirm("������ �����Ͻðڽ��ϱ�?"))
	window.location = murl;
}

//----------------------- ���̵� / �н����� ã�� ----------------------------
function Find_ID(theForm) 
{
	if (!theForm.name.value) {
		window.alert("������ �Է��Ͻʽÿ�.");
		theForm.name.focus();
		return false;
	}
	if (!theForm.jumin.value) {
		window.alert("�ֹε�Ϲ�ȣ�� '-'���� �Է��Ͻʽÿ�.");
		theForm.jumin.focus();
		return false;
	}
	if (!theForm.email.value) {
		window.alert("ȸ�����Խ� �Է��ϼ̴� E-mail�ּҸ� �Է��Ͻʽÿ�.");
		theForm.email.focus();
		return false;
	}
}

//--------------------- ���� ���� CHECK -------------------------
function formatChk(theForm)
{	
    var fname = theForm.value;
    sp_arry = fname.split(".");
    sp_einx = sp_arry.length - 1;
    sp_arry[sp_einx] = sp_arry[sp_einx].toLowerCase();

	return sp_arry[sp_einx];
}

//----------------------- ȸ���˻� ----------------------------
function User_send(theForm) 
{
	var cnt = 0;
	for( var i=0; i< theForm.elements.length; i++)
	{
		var temp = theForm.elements[i];
		if(temp.value != "")
		cnt += 1;
	}
	if (cnt == 0)
	{
		window.alert("�Ѱ��� �̻��� �˻����ǰ� �˻�� ����,�Է��Ͻʽÿ�.");
		theForm.key.focus();
		return false;
	}else{
		if(theForm.key.value != "" && !theForm.keyword.value){
			window.alert("�˻�� �Է��Ͻʽÿ�.");
			theForm.keyword.focus();
			return false;
		}
		if(theForm.keyword.value != "" && !theForm.key.value){
			window.alert("�˻������� �����Ͻʽÿ�.");
			theForm.key.focus();
			return false;
		}
	}
}

function goQuiz()
{
	document.times_form.submit();
}

//------------------ ����� ���� --------------
function Chk_poll(theForm)
{
	var num = document.poll_frm.num.value;

	for(var i = 0; i < document.poll_frm.item.length; i++) {
		if(document.poll_frm.item[i].checked == true) break;
	}
	if(i == document.poll_frm.item.length) {
		alert('�׸��� �����Ͽ� �ֽʽÿ�.');
		return;
	}

	var window_left = (screen.width-640)/2;
	var window_top = (screen.height-480)/2;

	mUrl = "/poll.php?num=" + num + "&item=" + document.poll_frm.item[i].value;
	window.open(mUrl,'poll','width=549,height=500,scrollbars=yes,resizable=yes,top=' + window_top + ',left=' + window_left + ''); 
	return false;
	theForm.submit();
}

//--------------------  �˾�â --------------------
function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}

//----------------------- ���̵� / �н����� ã�� ----------------------------
function Abst_Find(theForm) 
{
	if (!theForm.key_word.value)
	{
		window.alert("�˻�� �Է��Ͻʽÿ�.");
		theForm.key_word.focus();
		return false;
	}
}

//----------------- ���� �˾� -------------------------
function openWin(murl,msize){ 
	window.open(murl,"quizpop",msize)
}

//------------------ �α��� CHECK --------------
function Loginsubmit() 
{
	window.alert("ȸ����������Դϴ�.");
	return false;
}

/////////////////////////////////////////////////
/////// byte check  .. Daum version..
////////////////////////////////////////////////
function updateChar(length_limit)
{
	var comment='';
	comment = eval("document.theForm.content");
	var form = document.theForm;
	var length = calculate_msglen(comment.value);
	document.getElementById("textlimit").innerHTML = length;
	if (length > length_limit) {
		alert("�ִ� " + length_limit + "byte�̹Ƿ� �ʰ��� ���ڼ��� �ڵ����� �����˴ϴ�.");
		comment.value = comment.value.replace(/\r\n$/, "");
		comment.value = assert_msglen(comment.value, length_limit);
	}
}

function calculate_msglen(message)
{
	var nbytes = 0;

	for (i=0; i<message.length; i++) {
		var ch = message.charAt(i);
		if(escape(ch).length > 4) {
			nbytes += 2;
		} else if (ch == '\n') {
			if (message.charAt(i-1) != '\r') {
				nbytes += 1;
			}
		} else if (ch == '<' || ch == '>') {
			nbytes += 4;
		} else {
			nbytes += 1;
		}
	}

	return nbytes;
}

function assert_msglen(message, maximum)
{
	var inc = 0;
	var nbytes = 0;
	var msg = "";
	var msglen = message.length;

	for (i=0; i<msglen; i++) {
		var ch = message.charAt(i);
		if (escape(ch).length > 4) {
			inc = 2;
		} else if (ch == '\n') {
			if (message.charAt(i-1) != '\r') {
				inc = 1;
			}
		} else if (ch == '<' || ch == '>') {
			inc = 4;
		} else {
			inc = 1;
		}
		if ((nbytes + inc) > maximum) {
			break;
		}
		nbytes += inc;
		msg += ch;
	}
	document.getElementById("textlimit").innerHTML = nbytes;
	return msg;
}
/////////////////////////////////////////////////
/////// byte check  .. Daum version..
////////////////////////////////////////////////

function poll_check(sform){
	if(!radioCheck(sform.q_1)){
		alert("1�� ������ üũ�ϼ���!");
		sform.q_1[0].focus();
		return false;
	}
	if(!radioCheck(sform.q_2)){
		alert("2�� ������ üũ�ϼ���!");
		sform.q_2[0].focus();
		return false;
	}
	if(!radioCheck(sform.q_3)){
		alert("3�� ������ üũ�ϼ���!");
		sform.q_3[0].focus();
		return false;
	}
	if(!radioCheck(sform.q_4)){
		alert("4�� ������ üũ�ϼ���!");
		sform.q_4[0].focus();
		return false;
	}
	if(!radioCheck(sform.q_5_1)){
		alert("5-1�� ������ üũ�ϼ���!");
		sform.q_5_1[0].focus();
		return false;
	}
	if(!radioCheck(sform.q_5_2)){
		alert("5-2�� ������ üũ�ϼ���!");
		sform.q_5_2[0].focus();
		return false;
	}
	if(!radioCheck(sform.q_5_3)){
		alert("5-3�� ������ üũ�ϼ���!");
		sform.q_5_3[0].focus();
		return false;
	}
	if(!radioCheck(sform.q_5_4)){
		alert("5-4�� ������ üũ�ϼ���!");
		sform.q_5_4[0].focus();
		return false;
	}
	if(!radioCheck(sform.q_5_5)){
		alert("5-5�� ������ üũ�ϼ���!");
		sform.q_5_5[0].focus();
		return false;
	}
	sform.action = "poll.php";
	return true;
}
function Msearch_Frm(theForm)
{
	if (!theForm.key_word.value && !theForm.univ.value && !theForm.office.value && !theForm.of_type.value)
	{
		alert("�˻� ������ �Է� �Ǵ� ���� �Ͻʽÿ�.");
		theForm.key_word.focus();
		return false;
	}
}


function Chk_poll_1(no)
{
        var f = document.poll_frm;
        var num = document.poll_frm.num.value;	
		
			
		for(var i = 0; i < document.poll_frm.item0.length; i++) {
				if(document.poll_frm.item0[i].checked == true) break;
		}
		if(i == document.poll_frm.item0.length) {
				alert('�׸��� �����Ͽ� �ֽʽÿ�.');
				return;
		}

        f.action = "/sub/vote/poll.php?num=" + num + "&item=" + document.poll_frm.item0[i].value;
        f.submit();
}

function Chk_poll_new()
{
    var f = document.poll_frm;
	var num = document.poll_frm.num.value;	
	theForm = document.poll_frm;
	var Cnt = theForm.sub_cnt.value;
	for(var idx = 1; idx <= Cnt; idx++) {
		var item = eval("theForm.item" + idx);
		if(typeof(item) == 'object' && !radioCheck(item)){
			alert("�׸��� �����Ͽ� �ֽʽÿ�.");
			item[0].focus();
			return false;
		}
	}
	f.action = "/sub/vote/poll.php?num=" + num + "sub_cnt=" + Cnt;
    f.submit();
	return true;

}
/******************************************************************************************************
 *	���� ���ε� ���� �Լ�
 ******************************************************************************************************/

function AttachFiles() {
	document.UpLoad.AttachFiles();
}
function DeleteFiles() {
	document.UpLoad.DeleteFiles();
}


// �� �˻� (�޼��� ��� / ������ �����ϰ� ���̸� true �ƴϸ� false)
function chkBlank_msg(box, msg) {
	var valid = box.value.replace(/\s/gi,"");
	if (valid=="") {
		if (!msg) msg = "�� ���Դϴ�. ���� �Է��ϼ���.";
		alert(msg); box.focus();
		return true;
	}
	return false;
}