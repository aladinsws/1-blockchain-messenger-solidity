require("@nomicfoundation/hardhat-toolbox");

const fs = require("fs");
const mnemonic = fs.readFileSync('.secret').toString().trim();
const infuraProjectId = fs.readFileSync('.infura').toString().trim();

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  networks: {
    sepolia: {
      url: `https://sepolia.infura.io/v3/${infuraProjectId}`,
      accounts: {
        mnemonic
      },
    },
  },
  etherscan: {
    apiKey: fs.readFileSync(".etherscan").toString().trim(),
  },
  sourcify: {
    enabled: false
  },
  solidity: "0.8.27",
};
