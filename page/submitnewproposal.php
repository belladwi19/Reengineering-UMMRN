<div class="container">
        <div class="row">
        <div style="width:100%; padding-top:50px;">
                <h2>Submit New Proposal</h2>
                <hr />
            </div>
            
            <div class="col-lg-6">
                <div class="text-container">
                    <h3>Requirements and Rules</h3>
                    <p>Please read the requirements and rules carefully before submitting your new proposal project.</p>
                    <?php
                        include"koneksi.php";
                        $sql="select * from cfps where id_cfp=2";
                        $query=mysqli_query($koneksi,$sql);
                        while($row=mysqli_fetch_array($query,MYSQLI_NUM)){
                            echo"$row[2]";
                        
                        }
                    ?>
                    <p />
                </div> <!-- end of text-container -->
            </div> <!-- end of col -->
            <div class="col-lg-6">
                <?php
                    echo"
                        <form name='submitNewProposal' method='POST' enctype='multipart/form-data' action='index.php?page=submitnewproposalaction'>
                            <div class='form-group'>
                                <input name='judul' class='form-control-input' id='cmessage' required></input>
                                <label class='label-control' for='cmessage'>Judul</label>
                                <div class='help-block with-errors'></div>
                            </div>

                            <div class='form-group'>
                                <input name='tahun' class='form-control-input' id='cmessage' required></input>
                                <label class='label-control' for='cmessage'>Tahun</label>
                                <div class='help-block with-errors'></div>
                            </div>
                            
                            <div class='form-group'>
                                <input type='file' class='form-control-input' id='cmessage' required>
                                <label class='label-control' for='cmessage'>Dokumen</label>
                                <div class='help-block with-errors'></div>
                            </div>
                            <div class='form-group'>
                                <button type='submit' class='form-control-submit-button'>SUBMIT NEW PROPOSAL</button>
                            </div>
                            <div class='form-message'>
                                <div id='cmsgSubmit' class='h3 text-center hidden'></div>
                            </div>
                        </form>
                        <!-- end of contact form -->
                        ";
                ?>
            </div> <!-- end of col -->
        </div> <!-- end of row -->
    </div> <!-- end of container -->
