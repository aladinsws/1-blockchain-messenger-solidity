const { expect } = require("chai");
const hre = require("hardhat");
const { loadFixture } = require("@nomicfoundation/hardhat-network-helpers");


describe("Spacehorse", () => {
    async function deploySpacehorseAndMintTokenFixture() {
        const Spacehorse = await hre.ethers.getContractFactory("Spacehorse");
        const [owner, otherAccount] = await ethers.getSigners();
        const spacehorseInstance = await Spacehorse.deploy(owner);

        await spacehorseInstance.safeMint(otherAccount.address);

        return { spacehorseInstance };
    }

    it("is possible to mint a token", async () => {
        const { spacehorseInstance } = await loadFixture(deploySpacehorseAndMintTokenFixture);
        const [owner, otherAccount] = await ethers.getSigners();

        expect(await spacehorseInstance.ownerOf(0)).to.equal(otherAccount.address);
    });

    it("fails to transfer tokens from the wrong address", async () => {
        const { spacehorseInstance } = await loadFixture(deploySpacehorseAndMintTokenFixture);
        const [owner, otherAccount, notTheNFTOwner] = await ethers.getSigners();


        expect(await spacehorseInstance.ownerOf(0)).to.equal(otherAccount.address);
        await expect(spacehorseInstance.connect(notTheNFTOwner).transferFrom(otherAccount.address, notTheNFTOwner.address, 0)).to.be.reverted;
    });
})