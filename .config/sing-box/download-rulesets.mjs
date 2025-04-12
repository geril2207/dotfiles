#! /usr/bin/env node

import { execSync } from "node:child_process";
import path from "node:path";

const main = () => {
  const downloadUrl =
    "https://github.com/runetfreedom/russia-v2ray-rules-dat/releases/latest/download/sing-box.zip";

  const downloadPath = "/tmp/sing-box.zip";

  execSync(`curl -L -o ${downloadPath} ${downloadUrl}`);

  const geoipFiles = ["ru", "private", "ru-blocked"];
  const geositeFiles = [
    "private",
    "category-ads-all",
    "category-ru",
    "ru-blocked",
  ];
  const geoipZipFolder = "rule-set-geoip";
  const geositeZipFolder = "rule-set-geosite";
  const geoipZipFilePrefix = "geoip";
  const geositeZipFilePrefix = "geosite";

  const outputLocation = path.resolve(process.cwd(), "rulesets");

  const extractFiles = [];

  for (const item of geoipFiles) {
    extractFiles.push(`${geoipZipFolder}/${geoipZipFilePrefix}-${item}.srs`);
  }

  for (const item of geositeFiles) {
    extractFiles.push(
      `${geositeZipFolder}/${geositeZipFilePrefix}-${item}.srs`,
    );
  }

  execSync(
    `unzip -o ${downloadPath} ${extractFiles.map((item) => `'${item}'`).join(" ")} -d ${outputLocation}`,
  );

  for (const folder of [geoipZipFolder, geositeZipFolder]) {
    execSync(`mv ${outputLocation}/${folder}/* ${outputLocation}`);
    execSync(`rm -rf ${outputLocation}/${folder}`);
  }
};

main();
