
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="bootstrap.jspf"/>
        <title>Manter Ranking</title>
    </head>
    <body>
        <jsp:include page="barra_superior.jspf"/>
        <h3>${operacao}</h3>

        <form action="ManterRankingController?acao=confirmar${operacao}" method="post" name="frmManterRanking">
            <table>
                <tr>
                    <td>Código do ranking:</td> 
                    <td><input type="text" name="txtIdRanking" value="${ranking.id}" <c:if test="${operacao != 'Incluir'}"> readonly</c:if>></td>
                    </tr>
                    <tr>
                        <td>Nome do ranking:</td> 
                        <td><input type="text" name="txtNomeRanking" value="${ranking.nome}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                </tr>
                <tr>
                    <td><input type="submit" name="btnConfirmar" value="Confirmar"></td>
                </tr>
            </table>
        </form>

    </body>
</html>
