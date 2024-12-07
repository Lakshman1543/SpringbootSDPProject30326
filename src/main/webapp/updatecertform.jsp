<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="updatecert" method="post" enctype="multipart/form-data">
    <input type="hidden" name="certificationId" value="${certification.certificationId}">
    <div class="form-group">
        <label for="certname">Certification Name:</label>
        <input type="text" id="certname" name="certname" class="form-control" value="${certification.certificationname}" required>
    </div>

<div class="form-row">
            <label>Issued By</label>
            <input type="text" name="issuedBy" value="${certification.issuedBy}" required="required" />
        </div>

        <div class="form-row">
            <label>Issue Date</label>
            <input type="date" name="issuedate" value="${certification.issuedate}" required="required" />
        </div>
        
    <div class="form-group">
        <label for="expirydate">Expiry Date:</label>
        <input type="date" id="expirydate" name="expirydate" class="form-control" value="${certification.expirydate}" required>
    </div>
    
    <div class="form-row">
            <label>Status</label>
            <select name="status" required="required">
                <option value="">---Select---</option>
                <option value="Active">Active</option>
                <option value="Expired">Expired</option>
            </select>
        </div>
    
    <div class="form-row">
            <label>Certificate File (PDF)</label>
            <input type="file" name="certificatefile" required="required" accept="application/pdf" />
        </div>
        
        <div class="form-row">
        <label for="isGlobal">Is Global?</label>
        <input type="checkbox" id="isGlobal" name="isGlobal" value="true">
    </div>

    <button type="submit" class="btn btn-primary">Update</button>
</form>

</body>
</html>