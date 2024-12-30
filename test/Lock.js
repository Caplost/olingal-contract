const {
  time,
  loadFixture,
} = require("@nomicfoundation/hardhat-toolbox/network-helpers");
const { anyValue } = require("@nomicfoundation/hardhat-chai-matchers/withArgs");
const { expect } = require("chai");
const hre = require("hardhat");

describe("Olingl", function () {

  async function deployFixture() {
    const token = await hre.ethers.deployContract("MyToken");
    return {
      token,
    };
  }

  describe("init", function () {
    it("should init", async function () {
      const { token } = await loadFixture(deployFixture);
      expect(await token.name()).to.equal("Olingl");
    });
  });

});
