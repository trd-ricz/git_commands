describe("Axis Staging Login", () => {
    it('Login Axis App', () => {
        cy.visit(Cypress.env('host'))
        cy.login()
    })
})