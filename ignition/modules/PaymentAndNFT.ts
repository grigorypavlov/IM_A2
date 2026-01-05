import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

// Deploys PaymentToken and NFTMinter together.
// - PaymentToken initialOwner: deployer (module default msg.sender)
// - NFTMinter initialOwner: deployer
// - NFTMinter paymentTokenAddress: address of deployed PaymentToken

export default buildModule("PaymentAndNFTModule", (m) => {
  // Deploy fungible PaymentToken; constructor: (address initialOwner)
  const paymentToken = m.contract("PaymentToken", [m.getAccount(0)]);

  // Deploy NFTMinter; constructor: (address initialOwner, address paymentTokenAddress)
  const nftMinter = m.contract("NFTMinter", [m.getAccount(0), paymentToken]);

  return { paymentToken, nftMinter };
});
