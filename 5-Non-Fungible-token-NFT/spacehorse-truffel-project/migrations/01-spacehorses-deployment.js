const Spacehorse = artifacts.require("Spacehorse");

module.exports = function (deployer,networks, accounts) {
    const initialOwner = accounts[0];
    console.log(initialOwner);
    deployer.deploy(Spacehorse, initialOwner, {from: accounts[0]});
}