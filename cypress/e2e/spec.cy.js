describe('template spec', () => {
  it('passes', () => {
    cy.visit('https://prestashop.traefik.me');
    cy.screenshot('first-page');
  })
})