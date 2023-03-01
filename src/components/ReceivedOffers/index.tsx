import { useMainContext } from "../../contexts/ContextApp";

const ReceivedOffers = () => {
  const { personEntries } = useMainContext();

  return <h1>Received Offers</h1>;
};

export default ReceivedOffers;
