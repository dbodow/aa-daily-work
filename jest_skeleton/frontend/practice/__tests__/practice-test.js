import { sum, screamify } from "../practice";

describe('sum', () => {
  test("should add two numbers", () => {
    expect(sum(1, 2)).toEqual(3);
  });
});

describe('screamify', () => {
  const lowerString = "i am a string";
  const upperString = "I AM A STRING";
  const emptyStr = "";
  
  test("should upcase a string", () => {
    expect(screamify(lowerString)).toEqual(upperString);
  });

  test("should return an empty string given an empty string", () => {
    expect(screamify("")).toEqual("");
  });
});
