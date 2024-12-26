import Button from 'react-bootstrap/Button';
import Modal from 'react-bootstrap/Modal';
import Container from 'react-bootstrap/Container';

export default function CoorpContratada({mostrar,setModalContrato,nome}){
  return(
    <Container className='mt-4'>
      <Modal
        show={mostrar}
        backdrop="static"
        keyboard={false}
        onHide={() => setModalContrato({mostrar: false})}
        className='text-light'
      >
        <Modal.Header closeButton closeVariant='white' style={{backgroundColor: 'rgba(5, 5, 130, .8)'}}>
          <Modal.Title>Contrato com a coorperativa de energia <span className='text-warning'>"{nome}"</span> feito com sucesso!</Modal.Title>
        </Modal.Header>
        <Modal.Body style={{backgroundColor: 'rgba(5, 5, 130, .8)'}}>
          Enviaremos o pedido para a coorperativa <span className='text-warning fw-bold'>"{nome}"</span> e em seguida entraremos em contato com você.
        </Modal.Body>
        <Modal.Footer style={{backgroundColor: 'rgba(5, 5, 130, .8)'}}>
          <Button variant="success" onClick={() => setModalContrato({mostrar:false})}>
            Entendi
          </Button>
        </Modal.Footer>
      </Modal>
    </Container>
  )
}