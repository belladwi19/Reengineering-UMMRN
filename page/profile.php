<!-- Description -->
<div class="cards-1">
    <div class="container">
        <div class="row">

        <div style="width:100%;">
                <h2>Profile</h2>
                <hr />
            </div>
            <div class='col-lg-3'>
                            <div class='text-container'>
                            <div class='image-wrapper' style='margin-bottom:10px;'>
                    <img class='img-fluid' style='height:300px; width:250px;' src='images/ilyas.jpg' alt='alternative'>
                </div> 
            </div>
            </div>
            <div class='col-lg-9'>
            <?php
                include"koneksi.php";
                $sql="select * from students where id_student=$_GET[id]";
                $query=mysqli_query($koneksi,$sql); 
                while($row=mysqli_fetch_array($query,MYSQLI_NUM)){
                    echo"
                    <div class='form-group'>
                        <h4>Nama<h4>
                        <h2>$row[1]</h2>
                        </div>
                        <div class='form-group'>
                        <h4>NIM<h4>
                        <h2>$row[2]</h2>
                        </div>
                        <div class='form-group'>
                        <h4>PHONE<h4>
                        <h2>$row[3]</h2>
                        </div>
                        <div class='form-group'>     
                        <h4>Email<h4>
                        <h2>$row[4]</h2>
                        </div>
                        <div class='form-group'>  
                        <h4>Username<h4>
                      
                        <h2>$row[5]</h2>
                        </div>
                ";}
                ?>
        </div >
    </div>
</div>

<script>
function myFunction() {
  document.getElementById("myBtn").disabled = false;
  document.getElementById("field1").disabled = false;
  document.getElementById("field2").disabled = false;
  document.getElementById("field3").disabled = false;
  document.getElementById("field4").disabled = false;
  document.getElementById("field5").disabled = false;
}
</script>