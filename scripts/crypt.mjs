import crypto from "node:crypto";

const algorithm = "aes-256-ecb";

const encrypt = (text, key) => {
  const cipher = crypto.createCipheriv(algorithm, key, null);
  const encrypted = cipher.update(text, "utf8", "hex");
  const final = cipher.final("hex");
  return encrypted + final;
};

const decrypt = (encrypted, key) => {
  const decipher = crypto.createDecipheriv(algorithm, key, null);
  const decrypted = decipher.update(encrypted, "hex", "utf8");
  const final = decipher.final("utf8");
  return decrypted + final;
};

const ACTIONS = {
  ENCRYPT: "encrypt",
  DECRYPT: "decrypt",
};

const main = () => {
  const [action, secret, input] = process.argv
    .slice(2, 5)
    .map((item) => item.trim());
  if (!Object.values(ACTIONS).includes(action)) {
    throw new Error("Invalid action");
  }
  if (!secret) {
    throw new Error("Secret key didn't provided");
  }
  if (!input) {
    throw new Error("No input");
  }

  const key = crypto.createHash("sha256").update(secret).digest();

  switch (action) {
    case ACTIONS.ENCRYPT: {
      const encrypted = encrypt(input, key);
      console.log(encrypted);
      return;
    }

    case ACTIONS.DECRYPT: {
      const decrypted = decrypt(input, key);
      console.log(decrypted);
      return;
    }

    default:
      return;
  }
};

main();
