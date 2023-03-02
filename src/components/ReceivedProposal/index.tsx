import Text from "../../styles/Typography";
import StyledReceivedProposal from "./style";
import TextField from "@mui/material/TextField";
import SendIcon from "@mui/icons-material/Send";
import { LoadingButton } from "@mui/lab";
import { ChangeEvent, FormEvent, useState } from "react";
import { useMainContext } from "../../contexts/ContextApp";

const ReceivedProposal = () => {
  const { sendEmail } = useMainContext();
  const [email, setEmail] = useState("");
  const [name, setName] = useState("");
  const { loading, setLoading} = useMainContext();

  const handleEmail = (e: ChangeEvent<HTMLInputElement>) =>
    setEmail(e.target.value);

  const handleName = (e: ChangeEvent<HTMLInputElement>) =>
    setName(e.target.value);

  const handleForm = (e: FormEvent<HTMLFormElement>) => {
    setLoading(true);
    e.preventDefault();

    const data = {
      to_name: name,
      to_email: email,
    };

    if (!name || !email) {
      alert("Nome ou e-mail não devem estar vazios.");
    }

    sendEmail(data);
  };

  return (
    <StyledReceivedProposal>
      <Text tag="h2" fontSize="title3">
        Contato
      </Text>
      <Text fontSize="text3">
        Por favor, adicione suas informações abaixo para que possamos entrar em
        contato com você via e-mail com uma proposta e o contrato da nossa
        parceria.
      </Text>
      <form onSubmit={handleForm}>
        <TextField
          helperText={!email && "Nome obrigatório!"}
          error={!name}
          required
          fullWidth
          label="Nome"
          variant="outlined"
          onChange={handleName}
        />
        <TextField
          helperText={!email && "Email obrigatório!"}
          error={!email}
          required
          fullWidth
          label="Email"
          variant="outlined"
          onChange={handleEmail}
        />
        <LoadingButton
          loading={loading}
          type="submit"
          variant="contained"
          endIcon={<SendIcon />}
        >
          Receber contrato
        </LoadingButton>
      </form>
    </StyledReceivedProposal>
  );
};

export default ReceivedProposal;
