<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
    <title>BC Hydro - eMetering</title>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="Content-Language" content="en-us"/>
    <meta http-equiv="imagetoolbar" content="false"/>
    <meta name="MSSmartTagsPreventParsing" content="true"/>
    <meta name="robots" content="all"/>
    <meta name="copyright" content="Copyright (c) 2008 BC Hydro"/>

    <link rel="stylesheet" type="text/css" media="all" href="includes/css/interim_extranet_apps.css"/>
    <link rel="stylesheet" type="text/css" media="all" href="includes/css/emeterloginpopup.css"/>

    <script src="scripts/jquery-1.12.3.min.js" type="text/javascript">
    </script>


</head>

<body>
<div id="container">
    <div id="header">
        <IMG alt=BChydro src="includes/img/BC_Hydro_logo.png">
    </div>
    <!-- /end #header -->

    <div id="bodyWrapper">
        <div id="sideBar">
            <div id="sideNav">
                <h4>Registered User</h4>
                <div class="sidebarstd">
                    Already an eMetering user?
                    <br/> Log in below.
                </div>
                <form method="POST" name="emeterLoginForm" id="emeterLoginForm" action="/">
                    <div class="sidebarstd">
                        <b>User ID</b>
                        <input type="text" name="UserID" id="UserID"/>
                    </div>
                    <div class="sidebarstd">
                        <b>Password</b>
                        <input type="password" name="password" id="password"/>
                    </div>
                    <div class="sidebarstd" align="right">
                        <input type="button" id="loginButton" value="Login"/>
                        <br>
                    </div>
                    <input type="hidden" name="urlstring" value="${webapi.url}"/>
                    <!--<input type="hidden" name="height"/>-->
                    <!--<input type="hidden" name="browser"/>-->
                </form>
                <!-- The Modal -->
                <div id="myModal" class="modal">

                    <!-- Modal content -->
                    <div class="modal-content">
                        <div class="modal-header">
                            <span class="close">×</span>
                            <h2>Select Destination</h2>
                        </div>
                        <div class="modal-body">
                            <table>
                                <tr>
                                    <th><a href="http://w3t3:7002/emeter/adminLogin.html" class="button-link ">eMeter</a></th>
                                    <th><a href="https://localhost:44301/home/login" class="button-link ">Demand Response</a></th>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <!-- /end #sideNav -->
    </div>
    <!-- /end #sideBar -->

    <div id="bcMain">
        <div id="bodyContent">
            <h1 style="text-transform: none;">Power Smart eMetering</h1>
            <div id="bcLeftCol">
                <div id="Application">
                    <p>BC Hydro's Power Smart e.Metering allows you to read the interval data from your BC Hydro revenue
                        meter.</p>
                    <p>
                        <a href="http://www.bchydro.com/powersmart/business.html">More
                            about Energy Savings Programs</a>
                    </p>
                    <p>
                        <b>Forgot your User ID / Password?</b>
                        <br/> eMail: transmission.billing@bchydro.com
                        <br/>
                </div>
                <!-- /end #Application -->
            </div>
            <div id="rightBar">
                <div class="dialog">
                    <div class="hd">
                        <div class="c"></div>
                    </div>
                    <div class="bd">
                        <div class="c">
                            <div class="s">
                                <h2>Quick Tip</h2>
                                <p>In eMetering all metering times go to 12:00 a.m. Pacific Standard Time.</p>
                            </div>
                        </div>
                    </div>
                    <div class="ft">
                        <div class="c"></div>
                    </div>
                </div>
            </div>
        </div>
        <!-- /end #bodyContent -->
    </div>
    <!-- /end #bcMain -->
</div>
<!-- /end #bodyWrapper -->
</div>
</body>
<script>

    // Get the modal
    var modal = document.getElementById('myModal');

    // Get the <span> element that closes the modal
    var span = document.getElementsByClassName("close")[0];


    $(document).ready(function () {
        modal.style.display = "none";

        $("#loginButton").click(function () {
            var form_data = {
                UserID: $("#UserID").val(),
                password: $("#password").val()
            };

            $.ajax({
                        type: "GET",
                        url: $("#urlstring").val(),
                        dataType: 'json',
                        data: form_data
                    })
                    .done(function (data) {
                        var parsed = data;
                        console.log(parsed.Status +  " " + parsed.DR + " " + parsed.token);
                        var status = parsed.Status;
                        var dr = parsed.DR;
                        if (status == 'OK' && dr == 'No') {
                            alert("OK, DR No");
                            //Check DR No w/o token. Direct to old eMeter ap.
                            location.href = "http://w3t3:7002/emeter/adminLogin.html";
                        }
                        if (status == 'OK' && dr == 'Yes') {
                            //Check DR yes w token. Show popup to give them option.
                            alert("OK, DR yes");

                        } else if (status == 'Bad password') {
                            // DR no w/o token
                            alert("Bad password");

                        } else if (status == 'Error') {
                            // DR no w/o token
                            alert("Error");
                        } else {
                            //
                            alert("else???");
                        }
                            modal.style.display = "block";
                    });


            return false; // keeps the page from not refreshing
        });
    });

</script>

</html>