describe("Axis Dev Project Test", () => {
    it('Login Axis App', () => {
        cy.visit(Cypress.env('host'))
        cy.login()
        cy.get('#vue_app_content > div.container-fluid > div > div.row.aboveGridButtons > div.col-lg-7.col-md-12.col-sm-12 > div > div.col-lg-4.col-md-4.col-xs-4.col-sm-4.p-l-0 > button.el-button.m-l-20.el-button--primary').click()
    })
})