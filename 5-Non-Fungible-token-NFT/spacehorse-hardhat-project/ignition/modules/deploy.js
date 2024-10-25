const { buildModule } = require("@nomicfoundation/hardhat-ignition/modules");

module.exports = buildModule("Deploy", (m) => {
  const spacehorse = m.contract("Spacehorse", [m.getAccount(0)]);

  console.log(
    `Deployed contract ${spacehorse.contractName}`
  );

  return { spacehorse };
});