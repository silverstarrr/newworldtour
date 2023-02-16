<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<meta charset="UTF-8">
<title>Insert title here</title>
   <!-- jQuery -->
   <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
   <!-- iamport.payment.js -->
   <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

</head>
<body style="margin:25px;">
<form class="row g-3 needs-validation" novalidate>
  <div class="col-md-4">
    <label for="validationCustom01" class="form-label">성</label>
    <input type="text" class="form-control" id="validationCustom01" value="Mark" required>
    <div class="valid-feedback">
      입력완료
    </div>
  </div>
  <div class="col-md-4">
    <label for="validationCustom02" class="form-label">이름</label>
    <input type="text" class="form-control" id="validationCustom02" value="Otto" required>
    <div class="valid-feedback">
      입력완료
    </div>
  </div>
  <div class="col-md-4">
    <label for="validationCustomUsername" class="form-label">닉네임</label>
    <div class="input-group has-validation">
      <span class="input-group-text" id="inputGroupPrepend">@</span>
      <input type="text" class="form-control" id="validationCustomUsername" aria-describedby="inputGroupPrepend" required>
      <div class="invalid-feedback">
        닉네임을 입력해주세요
      </div>
    </div>
  </div>
  <div class="col-md-6">
    <label for="validationCustom03" class="form-label">도시</label>
    <input type="text" class="form-control" id="validationCustom03" required>
    <div class="invalid-feedback">
      거주 도시를 입력해주세요.
    </div>
  </div>
  <div class="col-md-3">
    <label for="validationCustom04" class="form-label">지역</label>
    <select class="form-select" id="validationCustom04" required>
      <option selected disabled value="">선택하세요</option>
      <option value="노원구">노원구</option>
    </select>
    <div class="invalid-feedback">
      지역을 선택해주세요.
    </div>
  </div>
  <div class="col-md-3">
    <label for="validationCustom05" class="form-label">우편번호</label>
    <input type="text" class="form-control" id="validationCustom05" required>
    <div class="invalid-feedback">
      우편번호를 입력해주세요
    </div>
  </div>
  <div class="col-12">
    <div class="form-check">
      <input class="form-check-input" type="checkbox" value="" id="invalidCheck" required>
      <label class="form-check-label" for="invalidCheck">
        이용약관에 동의
      </label>
      <div class="invalid-feedback">
        이용약관에 동의하셔야 합니다.
      </div>
    </div>
  </div>
  <div class="col-12">
    <button class="btn btn-primary" type="submit">확인</button>
  </div>
</form>


<script>

(function () {
	  'use strict'

	  // Fetch all the forms we want to apply custom Bootstrap validation styles to
	  var forms = document.querySelectorAll('.needs-validation')

	  // Loop over them and prevent submission
	  Array.prototype.slice.call(forms)
	    .forEach(function (form) {
	      form.addEventListener('submit', function (event) {
	        if (!form.checkValidity()) {
	          event.preventDefault()
	          event.stopPropagation()
	        }

	        form.classList.add('was-validated')
	      }, false)
	    })
	})()
    
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>