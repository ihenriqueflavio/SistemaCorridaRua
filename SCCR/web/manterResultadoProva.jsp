
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="bootstrap.jspf"/>
        <title>Manter Resultado Prova</title>
    </head>
    <body>
        <jsp:include page="barra_superior.jspf"/>
        <h3>${operacao}</h3>

        <form action="ManterResultadoProvaController?acao=confirmar${operacao}" method="post" name="frmManterResultadoProva">
            <table>
                <tr>
                    <td>Código do resultado da prova:</td> 
                    <td><input type="text" name="txtIdResultadoProva" value="${resultadoProva.id}" <c:if test="${operacao != 'Incluir'}"> readonly</c:if>></td>
                    </tr>
                    <tr>
                        <td>Resultado da classificação:</td> 
                        <td><input type="text" name="txtResultadoClassificacao" value="${resultadoProva.resultadoClassificacao}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                    </tr>
                    <tr>
                        <td>Nome da prova:</td> 
                        <td><input type="text" name="txtNomeProva" value="${resultadoProva.nomeProva}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                </tr>
                <tr>
                    <td><input type="submit" name="btnConfirmar" value="Confirmar"></td>
                </tr>
            </table>
        </form>

    </body>
</html>
