#!/usr/bin/env node
import crypto from "node:crypto";
import { readFile, writeFile } from "node:fs/promises";

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

/**
 * @param {string} outputFile
 * @param {string} content
 * */
const writeOutput = (outputFile, content) => {
  if (!content.endsWith("\n")) {
    content += "\n";
  }
  return writeFile(outputFile, content, { encoding: "utf8" });
};

const main = async () => {
  const [action, secretFile, inputFile, outputFile] = process.argv
    .slice(2, 6)
    .map((item) => item.trim());

  const validations = [
    {
      condition: !Object.values(ACTIONS).includes(action),
      msg: "Invalid action",
    },
    { condition: !secretFile, msg: "Invalid secret file" },
    { condition: !inputFile, msg: "Invalid input file" },
    { condition: !outputFile, msg: "Invalid output file" },
  ];

  for (const validation of validations) {
    if (validation.condition) throw new Error(validation.msg);
  }

  const input = (await readFile(inputFile, { encoding: "utf8" })).trim();
  const secret = (await readFile(secretFile, { encoding: "utf8" })).trim();

  const key = crypto.createHash("sha256").update(secret).digest();

  switch (action) {
    case ACTIONS.ENCRYPT: {
      const result = encrypt(input, key);
      await writeOutput(outputFile, result);
      return;
    }

    case ACTIONS.DECRYPT: {
      const result = decrypt(input, key);
      await writeOutput(outputFile, result);
      return;
    }

    default:
      return;
  }
};

main();
