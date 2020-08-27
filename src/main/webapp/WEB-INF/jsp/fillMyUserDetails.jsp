<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="springform" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile</title>

        <!--bootstrap-->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
              integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <script
            src="https://code.jquery.com/jquery-3.4.1.js"
            integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
            crossorigin="anonymous">
        </script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
                integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
                integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
        crossorigin="anonymous"></script>
        <!--bootstrap-->
    </head>
    <body>
        <jsp:include page="noLogin-navbar.jsp"></jsp:include>

            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <hr>
        <springform:form id="form" action="/doInsertMyUserDetails" method="post" modelAttribute="myUserDetails" enctype="multipart/form-data">

            <springform:input path="detailsId" hidden="true"></springform:input>

                First Name: <springform:input type="text" path="firstName"></springform:input>

                Last Name: <springform:input type="text" path="lastName"/>

            Age: <springform:input type="number" path="age"/>

            Telephone: <springform:input type="tel" path="tel"/>

            Description: <springform:input type="textarea" path="uDescription"/>

            Upload Profile Photo: <input type="file" name="photo" accept="image/*"/>

            <button type="submit" id="submit" >Submit</button>
            <button type="reset">Clear</button>

        </springform:form>

        <c:if test="${pageContext['request'].userPrincipal != null}">
            <!--and is Keeper-->
            <security:authorize access="hasRole('ROLE_KEEPER') and isAuthenticated()">
                <!--TODO Address form-->
                <div>
                    <input id="autocomplete" placeholder="Enter your address"
                           onFocus="geolocate()" type="text"></input>
                </div>

            </security:authorize>

            <!--and is owner-->
            <security:authorize access="hasRole('ROLE_OWNER') and isAuthenticated()">

                <input type="text" id="petName" placeholder="Pet Name" />
                <select name="type" id="petType">
                    <option value="dog">Dog</option>
                    <option value="cat">Cat</option>
                    <option value="rabbit">Rabbit</option>
                    <option value="bird">Bird</option>
                </select>
                <input type="text" id="petDescription" placeholder="Type here a few info about your pet"/>
                <button id="ajaxButton">AjaxButton</button>
                <!--TODO FIX THIS-->
                <script>
                    $(document).ready(function () {

                        let petName = $("#petName");
                        let petType = $("#petType");
                        let petDescription = $("#petDescription");

                        //Send request to get the Pet of the owner
                        let getPetUrl = "/owner/myPet";
                        $.ajax({
                            url: getPetUrl
                        }).then(function (data) {

                            if (data !== null) {
                                importPetData(data);
                            }
                        });

                        // Send request to register the changed on the owner's Pet
                        let registerPetUrl = "/owner/registerPet";
                        $("#ajaxButton").click(function () {
                            alert("petname: " + petName.val());
                            console.log(petName.val());

                            //Alternative way to send get request (We want to change this to Post request but the respective controller does not support Post for some reason
                            //                        $.ajax({
                            //                            type: "GET",
                            //                            url: registerPetUrl,
                            //                            data:
                            //                                    {
                            //                                        petName: petName.val(),
                            //                                        petType: petType.val(),
                            //                                        petDescription: petDescription.val()
                            //                                    },
                            //                            success: importPetData(data)
                            //                        });
                        });
                        $("#submit").click(function (e) {
                            e.preventDefault();
                            $.get(
                                    registerPetUrl,
                                    {petName: petName.val(), petType: petType.val(), petDescription: petDescription.val()}
                            ).done(function (data) {
                                console.log(data);
                                importPetData(data);
                                $("#form").submit();
                            });

                        });
                        //Take the Pet and put it in the input fields
                        function importPetData(data) {

                            console.log(data);
                            petName.val(data.petName);
                            petType.val(data.petType);
                            petDescription.val(data.petDescription);
                        }

                    });
                </script>
            </security:authorize>
        </c:if>

    </body>
</html>
