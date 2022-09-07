import Container from 'react-bootstrap/Container';
import Nav from 'react-bootstrap/Nav';
import Navbar from 'react-bootstrap/Navbar';
import Offcanvas from 'react-bootstrap/Offcanvas';

export default function NavBa(){
  return(
    <Navbar expand='md' className="mb-3">
        <Container fluid> 
          <Navbar.Brand href="#" className='text-warning'>Marketplace de energia</Navbar.Brand>
          <Navbar.Toggle className='text-warning' aria-controls={`offcanvasNavbar-expand-md`} />
          <Navbar.Offcanvas
            id={`offcanvasNavbar-expand-md`}
            aria-labelledby={`offcanvasNavbarLabel-expand-md`}
            placement="start"
          >
            <Offcanvas.Header closeButton closeVariant='white'>
              <Offcanvas.Title id={`offcanvasNavbarLabel-expand-md`}>
              Marketplace de energia
              </Offcanvas.Title>
            </Offcanvas.Header>
            <Offcanvas.Body>
              <Nav className="justify-content-end flex-grow-1 pe-3">
                <Nav.Link href="#" className='text-warning'>Planos</Nav.Link>
                <Nav.Link href="#" className='text-warning'>Contato</Nav.Link>
                <Nav.Link href="#" className='text-warning'>Sobre</Nav.Link>
              </Nav>
            </Offcanvas.Body>
          </Navbar.Offcanvas>
        </Container>
    </Navbar>
  )
}