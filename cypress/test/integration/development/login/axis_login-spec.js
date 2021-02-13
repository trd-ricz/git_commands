describe("Axis Dev login", () => {
    it('Login Axis App', () => {
        cy.visit(Cypress.env('host'))
        cy.login()
    })
})