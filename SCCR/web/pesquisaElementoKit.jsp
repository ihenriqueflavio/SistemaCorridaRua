
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="bootstrap.jspf"/>
        <title>Manter inscrição</title>
    </head>
    <body>
        <jsp:include page="barra_superior.jspf"/>

        <table class="table table-bordered"> 
            <tr>

                <th>Item</th>
                <th>Kit</th>

            </tr>   
            <c:forEach items="${elementosKits}" var="elementoKit">
                <tr> 
                    
                    <td> 
                        <c:forEach items="${kits}" var="kit">
                            ${kit.nomeKit} <c:if test="${kit.id == elementoKit.kit_id}"> </c:if>
                        </c:forEach> 
                    </td>

                    <td> 
                        <c:forEach items="${itens}" var="item">
                            ${item.nomeItem} <c:if test="${item.id == elementoKit.item_id}"> </c:if>


                        </c:forEach> 
                    </td>
                    

                    <td><a href ="ManterElementoKitController?acao=prepararEditar&id=<c:out value="${elementoKit.kit_id}"/>"><button><span class="glyphicon glyphicon-pencil"></span></button></a></td>
                    <td><a href ="ManterElementoKitController?acao=prepararExcluir&id=<c:out value="${elementoKit.kit_id}"/>"><button><span class="glyphicon glyphicon-trash"></span></button></a></td>

              
            </c:forEach>
        </tr>
        <form action ="ManterElementoKitController?acao=prepararIncluir" method="post">
            <input type="submit" name="btIncluir" value="Incluir"/>
        </form>                    
    </body>
</html>