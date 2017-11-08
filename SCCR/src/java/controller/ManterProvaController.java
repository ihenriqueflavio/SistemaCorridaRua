package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Organizador;
import modelo.Percurso;
import modelo.Prova;
import modelo.Ranking;
import modelo.ResultadoProva;

public class ManterProvaController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
   protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String acao = request.getParameter("acao");
        if (acao.equals("prepararIncluir")) {
            prepararIncluir(request, response);
        } else {
            if (acao.equals("confirmarIncluir")) {
                confirmarIncluir(request, response);
            }
        }
    }
    public void prepararIncluir(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.setAttribute("operacao", "Incluir");
            request.setAttribute("organizador", Organizador.obterOrganizadores());
            request.setAttribute("ranking", Ranking.obterRankings());

            RequestDispatcher view = request.getRequestDispatcher("/manterProva.jsp");

            view.forward(request, response);
        } catch (ServletException ex) {
        } catch (IOException ex) {
        } catch (ClassNotFoundException ex) {
        }

    }
    public void confirmarIncluir(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("txtId"));
        String nomeProva = request.getParameter("txtNomeProva");
        String localLargada = request.getParameter("txtLocalLargada");
        String horarioLargada = request.getParameter("txtHorarioLargada");
        String dataProva = request.getParameter("txtDataProva");
        String maxParticipantes = request.getParameter("txtmaxParticipantes");
        String dataInicioInscricao = request.getParameter("txtInicioInscricao");
        String dataFimInscricao = request.getParameter("txtFimInscricao");
        String faixaEtaria = request.getParameter("txtFaixaEtaria");
        
        int organizador_id = Integer.parseInt(request.getParameter("txtOrganizador_id"));
        int ranking_id = Integer.parseInt(request.getParameter("txtRanking_id"));
    
   
        try {
            Organizador organizador = Organizador.obterOrganizador(organizador_id);
            Ranking ranking = Ranking.obterRanking(ranking_id);
            Prova prova = new Prova(id, nomeProva, localLargada, horarioLargada, dataProva, maxParticipantes, dataInicioInscricao, dataFimInscricao, faixaEtaria, organizador, ranking);
    
            prova.gravar();
            RequestDispatcher view = request.getRequestDispatcher("PesquisaProvaController");
            view.forward(request, response);
        } catch (IOException ex) {

        } catch (SQLException ex) {

        } catch (ClassNotFoundException ex) {

        } catch (ServletException ex) {

        }
    }
    
    
    
    

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}