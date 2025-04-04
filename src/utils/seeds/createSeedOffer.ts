import OfferEntity from "@/domain/entities/OfferEntity";

const cooperatives = ["EnerEasy", "EnerClean", "EnerBig"];

type CreateSeedOffer = (limit: number) => OfferEntity[];
const createSeedOffer: CreateSeedOffer = (limit) => {
  return [...Array(limit).keys()].map((id) => ({
    id: id,
    name: cooperatives[Math.floor(Math.random() * 3)],
    economy: +Math.random().toFixed(2),
    minMonthly: Math.ceil(Math.random() * (1e5 - 1000)) + 500,
    get maxMonthly() {
      return this.minMonthly + Math.ceil(Math.random() * 1000) + 1000;
    },
  }));
};

export default createSeedOffer;
