<?php
	include"koneksi.php";
    $judul=$_POST['judul'];
	$tahun=$_POST['tahun'];
	$dokumen=$_POST['dokumen'];

	$sql="insert into submit_proposal(judul,tahun,dokumen) values('$judul','$tahun','$dokumen')";
	$query=mysqli_query($koneksi,$sql);
    if($query){
        echo"
            <script>
                window.alert('Your request has been sent.');
                window.location.href='http://localhost/ummrn/';
            </script>
        ";
    }else{
        echo"
            <script>
                window.alert('You have been submit new proposal project.');
                window.location.href='http://localhost/ummrn/';
            </script>
        ";
    }
?>