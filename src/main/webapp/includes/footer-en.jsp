<footer class="container py-5">
    <hr>
    <div class="row">
        <div class="col-12 col-md">
            <p class="logo">Metropolitan</p>
            <div class="icons">
                <a href="https://twitter.com/metropolitangym" target="_blank" class="link-secondary"><i class="bi bi-twitter"></i></a>
                <a href="https://www.facebook.com/clubmetropolitan" target="_blank" class="link-secondary"><i class="bi bi-facebook"></i></a>
                <a href="https://www.instagram.com/metropolitangym/" target="_blank" class="link-secondary"><i class="bi bi-instagram"></i></a>
            </div>
        </div>
        <div class="col-6 col-md">
            <h5>Private area</h5>
            <ul class="list-unstyled text-small">
                <li><a class="link-secondary" href="areasocio.jsp">Member area</a></li>
                <li><a class="link-secondary" href="areaadmin.jsp">Admin area</a></li>
            </ul>
        </div>
        <div class="col-6 col-md">
            <h5>Our club</h5>
            <ul class="list-unstyled text-small">
                <li><a class="link-secondary" href="haztesocio.jsp">Become a member</a></li>
                <li><a class="link-secondary" href="areasocio.jsp">Book your activity</a></li>
            </ul>
        </div>
        <div class="col-6 col-md">
            <h5>Developed by</h5>
            <ul class="list-unstyled text-small">
                <li><a class="link-secondary" href="https://github.com/santir6" target="_blank">Santi Ballestin</a></li>
                <li><a class="link-secondary" href="https://github.com/raulcoroe" target="_blank">Raúl Martín</a></li>
                <li><a class="link-secondary" href="https://github.com/lara-ferrer" target="_blank">Lara Ferrer</a></li>
            </ul>
        </div>
    </div>

    <!--- SCRIPTS --->
    <!-- <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script> -->
    <script src="https://code.jquery.com/jquery-1.12.4.min.js" type="text/javascript"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="js/wow.js"></script>
    <script type="text/javascript">
        new WOW().init();
    </script>
    
    <script type="text/javascript">
            function tipo_change() {
                var tipo = $("#tipo").val();
                $.ajax({
                    type: "POST",
                    url: "tipo.jsp",
                    data: "idTipo=" + tipo,
                    cache: false,
                    success: function (response) {
                        $("#sala").html(response);
                    }
                });
            }
            function sala_change() {
                var sala = $("#sala").val();
                var tipo = $("#tipo").val();
                $.ajax({
                    type: "POST",
                    url: "sala.jsp",
                    data: {idSala: sala, idTipo: tipo},
                    cache: false,
                    success: function (response) {
                        $("#monitor").html(response);
                    }
                });
            }
        </script>
     
</footer>