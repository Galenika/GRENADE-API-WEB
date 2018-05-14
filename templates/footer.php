<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
    function activeNav() {
        var url = window.location.href.split("?")[0];
        $(".nav li a").filter(function () {
            return this.href == url;
        }).parent().addClass("active");
    }

    $(document).ready(function () {
        $("[data-toggle=tooltip]").tooltip();
        activeNav();
    });
</script>
</body>
</html>