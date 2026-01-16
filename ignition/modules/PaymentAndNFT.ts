import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

export default buildModule("PaymentAndNFTModule", (m) => {
  const paymentToken = m.contract("PaymentToken");
  const nftMinter = m.contract("NFTMinter", [paymentToken]);

  return { paymentToken, nftMinter };
});