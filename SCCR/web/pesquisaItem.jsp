
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="bootstrap.jspf"/>
        <title>Manter item</title>
    </head>
    <body>
        <jsp:include page="barra_superior.jspf"/>
    
        <div id="main" class="container-fluid" style="margin-top: 50px">

            <div id="top" class="row">
                <div class="col-sm-3">
                    <h2>Itens</h2>
                </div>
                <div class="col-sm-6">

                    <div class="input-group h2">
                        <input name="data[search]" class="form-control" id="search" type="text" placeholder="Pesquisar Item">
                        <span class="input-group-btn">
                            <button class="btn btn-primary" type="submit">
                                <span class="glyphicon glyphicon-search"></span>
                            </button>
                        </span>
                    </div>

                </div>
                <div class="col-sm-3">
                    <form action ="ManterItemController?acao=prepararIncluir" method="post">
                    <input type="submit" name="btIncluir" value="Novo Item" class="btn btn-primary pull-right h2">
                    
    
            </form> 
                </div>
            </div> <!-- /#top -->


            <hr />
            <div id="list" class="row">

                <div class="table-responsive col-md-12">
                    <table class="table table-striped" cellspacing="0" cellpadding="0">
                        <thead>
                            <tr>
                                <th>Código do item</th>
                                <th>Nome do item</th>
                               
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${itens}" var="item">
                            <tr>
                                


                                    <td><c:out value = "${item.id}" /></td>
                                    <td><c:out value = "${item.nomeItem}" /></td>
                                    
                                 
                                    <td class="actions">
                                        
                                        <a class="btn btn-warning btn-xs" href="ManterItemController?acao=prepararEditar&id=<c:out value="${item.id}"/>">Editar</a>
                                        <a class="btn btn-danger btn-xs"  href="ManterItemController?acao=prepararExcluir&id=<c:out value="${item.id}"/>" data-toggle="modal" data-target="#delete-modal">Excluir</a>
                                    </td>
                                </tr>
                                </c:forEach>
                                
                            </tbody>
                        </table>
                    </div>

                </div> <!-- /#list -->

              

            <!-- Modal -->
            <div class="modal fade" id="delete-modal" tabindex="-1" role="dialog" aria-labelledby="modalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Fechar"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="modalLabel">Excluir Item</h4>
                        </div>
                        <div class="modal-body">
                            Deseja realmente excluir este item?
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-primary">Sim</button>
                            <button type="button" class="btn btn-default" data-dismiss="modal">N&atilde;o</button>
                        </div>
                    </div>
                </div>
            </div>

            <script src="js/jquery.min.js"></script>
            <script src="js/bootstrap.min.js"></script>
            
            <jsp:include page="footer.jspf"/>

        </body>
    </html>
    </body>
</html>
