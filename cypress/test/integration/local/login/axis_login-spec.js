describe("Axis Local login", () => {
    it('Login Axis App', () => {
        cy.visit(Cypress.env('host'))
        cy.login()
    })
})