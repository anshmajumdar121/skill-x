[![English](https://img.shields.io/badge/English-Read-2b2b2b)](README.md) [![Español](https://img.shields.io/badge/Espa%C3%B1ol-Read-e67e22)](README.es.md) [![Português](https://img.shields.io/badge/Portugu%C3%AAs-Read-27ae60)](README.pt.md) [![日本語](https://img.shields.io/badge/日本語-Read-16a085)](README.ja.md) [![한국어](https://img.shields.io/badge/한국어-Read-2980b9)](README.ko.md) [![Deutsch](https://img.shields.io/badge/Deutsch-Read-8e44ad)](README.de.md) [![Français](https://img.shields.io/badge/Fran%C3%A7ais-Read-2c3e50)](README.fr.md) [![Türkçe](https://img.shields.io/badge/T%C3%BCrk%C3%A7e-Read-c0392b)](README.tr.md) [![繁體中文](https://img.shields.io/badge/繁體中文-Read-d35400)](README.zh-Hant.md) [![简体中文](https://img.shields.io/badge/简体中文-Read-e74c3c)](README.zh-Hans.md) [![Русский](https://img.shields.io/badge/Русский-Read-7f8c8d)](README.ru.md)

![Skill X](media/skill-x.gif)

[![MIT license](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![Skills](https://img.shields.io/badge/skills-4-purple.svg)](#skills-at-a-glance)
[![Self-evolving](https://img.shields.io/badge/super--skill-self--evolving-brightgreen.svg)](skills/super-skill/references/self-evolution.md)

Kod, araştırma ve çoklu-ajan orkestrasyonu için küçük, birleştirilebilir
bir agent skill koleksiyonu. Her skill kendi kendine yeterlidir, kanıta
dayalıdır ve aşamalı bilgi açıklaması (progressive-disclosure) sağlayan
referans dokümanlarıyla birlikte gelir.

> [anshmajumdar](https://github.com/anshmajumdar121) tarafından
> geliştirilmiştir. Skiller; kamuya açık araştırmalardan, GPT-5.6 Sol
> yürütme planından ve [BuilderIO/skills](https://github.com/BuilderIO/skills)
> koleksiyonundan derlenmiştir.

## Hızlı Başlangıç

```bash
# Depoyu klonlayın
git clone https://github.com/anshmajumdar/skill-x.git
cd skill-x

# Kurulacak bir skill seçin (manuel kopyalama)
cp -r skills/think-like-gpt-5-6   ~/.mavis/agents/<your-agent>/skills/
cp -r skills/efficient-fable      ~/.mavis/agents/<your-agent>/skills/
cp -r skills/skill-zero           ~/.mavis/agents/<your-agent>/skills/
cp -r skills/super-skill          ~/.mavis/agents/<your-agent>/skills/

# Veya hepsini kurun
for d in skills/*/; do
  cp -r "$d" ~/.mavis/agents/<your-agent>/skills/
done

# Kaydedildiklerini doğrulayın
mavis skill list
```

> `<your-agent>` kısmını kendi agent adınızla değiştirin (örn. `mavis`,
> `claude`, `codex` — skillerinizin bulunduğu yer neresiyse).

## Skillere Genel Bakış

| Skill | Satır | Ne yapar |
|---|---|---|
| [`think-like-gpt-5-6`](skills/think-like-gpt-5-6/SKILL.md) | 1.547 | Tam titizlik çerçevesi: 7 adımlı döngü, 10 prensip, 20 satırlık risk kaydı, 8 doğrulama katmanı, 6 kabul + 10 red kriteri, 18 çekişmeli (adversarial) inceleme sorusu, 7 bölümlük teslim-öncesi kontrol listesi. Basit olmayan her görev için en iyisi. |
| [`efficient-fable`](skills/efficient-fable/SKILL.md) | 302 | Delegasyon deseni: orkestratör + ucuz alt-ajanlar. 5 adımlı desen, devir teslim (handoff) paketi formatı, doğrulama protokolü, paralelleştirilebilir işlerde 3-5 kat daha ucuz + 2-4 kat daha hızlı. |
| [`skill-zero`](skills/skill-zero/SKILL.md) | 1.598 | Uzmanlık alanı: kodlama ajanı LLM'lerinin artık akışı (residual stream) üzerinde doğrusal problar. Mevcut program özelliklerini (iyi biçimlendirilmiş olma, tam/kısmi doğruluk, regresyon) çözer ve gelecekteki düzenleme sonuçlarını yaklaşık 25 adım ileriye kadar tahmin eder. Silva, Tu & Monperrus 2026 (arXiv:2607.05188) çalışmasına dayanır. |
| [`super-skill`](skills/super-skill/SKILL.md) | 2.096 | Titizlik + delegasyon sentezi. İki mod (titizlik / delegasyon), mod seçim akışı, doğrulama protokolü, 5 delegasyona özgü risk. **Kendi kendine gelişir**, 7 maddelik bir anayasa altında. |

### Hangi skill ne zaman kullanılır

- **Basit olmayan bir görevim var ve denetlenebilir çıktılar istiyorum.**
  → `think-like-gpt-5-6`
- **Paralelleştirilebilen, kod tabanı ağırlıklı bir işim var ve token
  tasarrufu yapmak istiyorum.** → `efficient-fable`
- **Bir kodlama ajanının içsel durumunu izlemek / yönlendirmek istiyorum
  (mekanistik yorumlanabilirlik).** → `skill-zero`
- **Hem titizlik HEM de delegasyon verimliliğini tek bir skill'de
  istiyorum.** → `super-skill`
- **Zamanla kendini geliştiren, saçmalığa karşı sıkı korumaları olan
  bir skill istiyorum.** → `super-skill` (kendi kendine evrim
  protokolüne sahip tek skill)

## Skill Detayları

### `/think-like-gpt-5-6`

GPT-5.6 Sol yürütme-zekası çerçevesini uygulayın. Kusurlu bir isteği,
**7 adımlı döngü** aracılığıyla doğrulanmış, denetlenebilir bir çıktıya
dönüştürün: Gözlemle → Yorumla → Karar Ver → Uygula → Doğrula →
Onar → Kaydet. **10 yönetici prensip**, **9 aşamalı mimari**, **20
satırlık risk kaydı**, **6 kabul + 10 red kriteri**, **18 sorudan
oluşan çekişmeli inceleme** ve **7 bölümlük teslim-öncesi kontrol
listesi** ile desteklenir.

En uygun kullanım: çok adımlı kodlama, atıflı araştırma, çıktı
oluşturma, operasyonel eylemler, yüksek riskli rehberlik ve akıcı bir
kara kutu cevaptan ziyade incelenebilir bir akıl yürütme istediğiniz
her görev.

Devamını okuyun: [skills/think-like-gpt-5-6/SKILL.md](skills/think-like-gpt-5-6/SKILL.md)

### `/efficient-fable`

Yüksek maliyetli bir öncü (frontier) modeli **orkestratör, mimar,
sentezleyici ve nihai hakem** olarak kullanın. Ucuz alt-ajanları
**sınırlı ağır işler** için kullanın (büyük depo taramaları, uzun log
indirgeme, dar kapsamlı kod yamaları, tarayıcı/test doğrulaması).
**Doğrulama protokolü** şunu söyler: *alt-ajan raporlarını gerçek
olarak değil, ipucu olarak ele alın* — göndermeden önce her zaman
belirtilen dosyayı yeniden açın, satır referansını doğrulayın ve
diff'i inceleyin.

**5 adımlı delegasyon deseni**: pahalı riski adlandırın → paralel
dilimlere bölün → ağır işler için ucuz ajanları kullanın → kısa ve
öz kanıt isteyin → orkestratör token'larını karar katmanına harcayın.

En uygun kullanım: bağımsız paralel parçalara bölünebilen, kod
tabanı ağırlıklı işler. Basit görevler, yüksek riskli tek kaynaklı
işler veya ucuz alt-ajanların bulunmadığı durumlar için atlayın.

Devamını okuyun: [skills/efficient-fable/SKILL.md](skills/efficient-fable/SKILL.md)

### `/skill-zero`

Artık akışı (residual stream) üzerinde doğrusal problar aracılığıyla
**kodlama ajanı LLM'lerinin mekanistik yorumlanabilirliği** konusunda
uzmandır. Silva, Tu & Monperrus 2026 çalışmasına dayanır
([arXiv:2607.05188](https://arxiv.org/abs/2607.05188)).

Bu skill size şunları öğretir:

- **Düzenleme sonuçlarını disk'e yazılmadan önce tahmin edin.** Gizli
  durumlar (hidden states) üzerinde bir lojistik regresyon probu
  eğiterek, yazılmak üzere olan düzenlemenin bir regresyon (◆
  Regresyon özelliği) getirip getirmeyeceğini veya testlerde başarısız
  olup olmayacağını (● Tam Doğruluk) okuyun.
- **Ajanın ilerleme kaydedip kaydetmediğini yörünge ortasında
  anlayın.** ■ Kısmi Doğruluk probu, ajanın test-geçme yönü hakkındaki
  güvenini gizli durumlardan okur (makalede AUC ~0,84).
- **Ajanın planına yaklaşık 25 adım ileriye bakın.** "Gizli programlama
  ufku" bulgusu: bir prob, yörüngenin başarısız bir duruma doğru
  gittiğini birkaç adım önceden işaretleyebilir.

Skill; makalenin özel sayılarını (AUC 0,83, ufuk k≈25, orta katman
ters-U deseni), 4 kanonik özelliği, karıştırılmış-etiket kontrol
disiplinini, çapraz-benchmark aktarım detayını ve 5 somut başarısızlık
modunu içerir.

Devamını okuyun: [skills/skill-zero/SKILL.md](skills/skill-zero/SKILL.md)

### `/super-skill`

Sentez: tek bir skill içinde **titizlik + delegasyon**. İki çalışma
modu:

- **Titizlik modu** (varsayılan) — GPT-5.6 Sol 7 adımlı döngüsünü, 10
  prensibi, 9 aşamalı mimariyi, görev sınıflandırmasını, risk kaydını,
  doğrulama katmanlarını, kabul/red kriterlerini, çekişmeli incelemeyi
  ve teslim-öncesi kontrol listesini kullanın.
- **Delegasyon modu** — bağımsız paralel dilimlere bölünebilen, kod
  tabanı ağırlıklı veya token ağırlıklı işler için, doğrulama
  protokolüyle birlikte Efficient Fable delegasyon desenini kullanın.

Mod, işe alım (intake) sırasında seçilir. Skill ayrıca **5 delegasyona
özgü risk** (R-D1 ila R-D5), 9. bir test (**T-09: alt-ajan raporu
doğrulaması**) ve test matrisine gömülü doğrulama protokolünü de
içerir.

**Kendi kendine evrilir.** Skill; saçmalığa karşı katı bir iç
**7 maddelik anayasa** altında zamanla büyüyebilir, gelişebilir ve
kendini budayabilir. Anayasa
(`skills/super-skill/references/self-evolution.md` içinde):

- **C-1** Kanıta dayalı — her değişiklik bir makaleye, resmi
  dokümana, kod bağlantısına veya doğrulanmış bir gözleme atıfta
  bulunmalıdır
- **C-2** Sınırlı kapsam — yalnızca titizlik + delegasyon çerçeveleri,
  kullanıcı projeleri değil
- **C-3** Muhafazakâr — spekülatif eklemeler yok
- **C-4** Kalite tabanı — yeni içerik, yerini aldığı içerik kadar iyi
  olmalıdır
- **C-5** Geri alınabilir — her değişikliğin bir değişiklik günlüğü
  satırı vardır
- **C-6** Saçmalık filtresi — belirsiz dolgu içerik reddedilir
- **C-7** Gizlilik — kişisel veri yok, projeye özgü içerik yok

Herhangi bir tek maddenin başarısız olması = değişikliğin reddi.
İstisna yok.

Devamını okuyun: [skills/super-skill/SKILL.md](skills/super-skill/SKILL.md)

## Birbirleriyle Nasıl Uyum Sağlıyorlar

<div align="center">

```
        ┌────────────────────────────────┐
        │      kullanıcı görevi gelir     │
        └───────────────┬────────────────┘
                         │
                         ▼
           ┌────────────────────────┐
           │  ne tür bir görev?      │
           └────────┬───────────────┘
     ┌───────────────────┼────────────────────────┐
     │                   │                        │
genel görev      gizli duruma erişimli    birden fazla ajanım
     │            herhangi bir kod         var ve bir meta
     │                                     çerçeve istiyorum
     ▼                   │                        │
┌─────────────────┐      ▼                        ▼
│ think-like-     │   ┌─────────────┐   ┌──────────────────┐
│ gpt-5-6         │   │ skill-zero  │   │  super-skill     │
│                 │   │             │   │  (titizlik+deleg,│
│ 7 adımlı döngü  │   │ gizli       │   │   kendi kendine  │
│ 10 prensip      │   │ durumlar    │   │   evrilen)       │
│ risk kaydı      │   │ üzerinde    │   │                  │
│ doğrulama       │   │ doğrusal    │   └──────────────────┘
│                 │   │ problar     │            │
└────────┬────────┘   └─────────────┘            │
         │                                        │
         └──────────────────┬─────────────────────┘
                             │
                             ▼
                ┌─────────────────────┐
                │ efficient-fable     │
                │ (delegasyon deseni) │
                │                     │
                │ 5 adımlı desen,     │
                │ devir teslim        │
                │ paketleri,          │
                │ doğrulama protokolü │
                └─────────────────────┘
                             ▲
                             │
        super-skill içinde delegasyon modunda kullanılır
        token ağırlıklı paralel işler için tek başına kullanılır
```

</div>

`super-skill`, çoğu karmaşık görev için önerilen varsayılandır.
Şunları içerir:

- Tam TLG titizlik çerçevesi (dış döngü olarak)
- Efficient Fable delegasyon deseni (hızlı şerit olarak)
- Kendi kendine evrim protokolü (7 maddelik anayasayla birlikte)

Diğer üç skill, kendi belirli tetikleyicileri için kullanılabilir
olmaya devam eder.

## Kurulum

Skiller, herhangi bir ajanın skill dizinine bırakılacak şekilde
tasarlanmıştır. Üç kurulum yolu vardır — ajanınızın desteklediğini
seçin.

### Yol A — Eklenti / market kurulumu (önerilen)

Bu depo, tek bir komutla kurulum yapabilmeniz için bir **Claude Code
eklenti marketi** ve bir **Codex eklentisi** olarak sunulmaktadır:

```bash
# Claude Code
/plugin marketplace add anshmajumdar/skill-x
/plugin install skill-x@skill-x

# Codex
codex plugin install anshmajumdar/skill-x

# Veya genel npx (Vercel'in skills CLI'ı)
npx skills@latest add anshmajumdar/skill-x --skill super-skill
```

Ajan başına tam kurulum matrisi için (Claude Code, Codex, OpenCode,
Copilot, ayrıca genel `cp -r` yedek yöntemi)
[PLUGIN_INSTALL.md](PLUGIN_INSTALL.md) dosyasına bakın.

### Yol B — Manuel kurulum (her ajan için çalışır)

```bash
# Klonlayın
git clone https://github.com/anshmajumdar/skill-x.git
cd skill-x

# Birini kurun
cp -r skills/super-skill ~/.mavis/agents/<your-agent>/skills/

# Hepsini kurun
for d in skills/*/; do
  cp -r "$d" ~/.mavis/agents/<your-agent>/skills/
done

# Doğrulayın
mavis skill list
```

### Ajan başına kurulum yolları

| Ajan | Skill yolu | Eklenti mi? |
|---|---|---|
| mavis | `~/.mavis/agents/<name>/skills/` | yok |
| Claude Code | `~/.claude/skills/` (kullanıcı) veya `.claude/skills/` (proje) | evet — `.claude-plugin/marketplace.json` |
| Codex CLI | `~/.codex/skills/` (kullanıcı) veya `.codex/skills/` (proje) | evet — `.codex-plugin/plugin.json` |
| OpenCode | `~/.config/opencode/skills/` (kullanıcı) veya `.opencode/skills/` (proje) | yalnızca manuel |
| GitHub Copilot | `.github/skills/` (proje) veya VS Code kullanıcı dizini | yalnızca manuel |

### Bir skill'in doğru kurulduğunu doğrulama

```bash
# Tek bir skill'i lint edin
node $(mavis skill show skill-creator | python3 -c 'import json,sys;print(json.load(sys.stdin)["location"])' | xargs dirname)/scripts/lint-skill.js skills/super-skill/

# Bu depodaki tüm skilleri lint edin
./scripts/lint-all.sh
```

## Kendi Kendine Evrim (yalnızca `/super-skill` üzerinde)

<br>

![Self-evolving: detect, evidence, constitution check, apply, verify](media/banner.png)

<br>

`super-skill`, kendi kendini geliştiren tek skill'dir. Protokol
[`skills/super-skill/references/self-evolution.md`](skills/super-skill/references/self-evolution.md)
dosyasında bulunur. Tetikleyiciler:

- **Açık**: "bu skill'i evrimleştir", "superskill evolve"
- **Bayat içerik tespiti**: belirli bir sayının, bağlantının veya
  iddianın kanıtlanabilir şekilde güncelliğini yitirmesi
- **Daha iyi teknik tespiti**: belirgin şekilde daha iyi bir tekniğin
  ortaya çıkması
- **Saçma içerik tespiti**: bir bölümün artık yerini hak etmemesi

5 adımlı prosedür: Tespit Et → Kanıtla → Anayasa kontrolü
(7 maddenin tamamı) → Uygula → Doğrula (yeniden lint et).
`super-skill/SKILL.md` dosyasının başındaki değişiklik günlüğü her
değişikliği kaydeder.

## Katkıda Bulunma

Katkılara açığız. İş akışı için [CONTRIBUTING.md](CONTRIBUTING.md)
dosyasına ve kalite çıtası konusunda rehberlik için skill içindeki
**kendi kendine evrim protokolüne** bakın. Kısa özet:

1. Her skill kendi kendine yeterlidir. Öyle kalmasını sağlayın.
2. Referans dokümanlar aşamalı bilgi açıklamasıdır — `SKILL.md` ön
   bilgidir, `references/*.md` ise ayrıntıdır.
3. Lint testlerinin geçmesi gerekir: `./scripts/lint-all.sh`.
4. Çalışma zamanında dış ağ çağrısı yok. Skiller statik markdown'dır.
5. Kişisel veri yok, projeye özgü içerik yok.

## Skiller Nasıl Oluşturuldu

| Skill | Kaynak | Nasıl sentezlendi |
|---|---|---|
| `think-like-gpt-5-6` | GPT-5.6 Sol Yürütme-Zekası Planı (v1.0, 2026-07-16) | 7 adımlı döngü, 10 prensip, 9 aşamalı mimari, 20 satırlık risk kaydına damıtıldı |
| `efficient-fable` | [BuilderIO/skills](https://github.com/BuilderIO/skills/tree/main/skills/efficient-fable) | yeniden düzenlendi: Fable'ın ötesine genelleştirildi, ne zaman kullanılmaması gerektiği eklendi, koleksiyonun geri kalanına çapraz referans verildi |
| `skill-zero` | Silva, Tu, Monperrus 2026 ([arXiv:2607.05188](https://arxiv.org/abs/2607.05188)) | doğrusal-prob metodolojisi, 4 kanonik özellik, beklenen AUC sayıları, 5 başarısızlık modu çıkarıldı |
| `super-skill` | `think-like-gpt-5-6` + `efficient-fable` sentezi | 5 delegasyon riski, mod-seçim akışı, doğrulama protokolü, 9. test T-09, 7 maddelik anayasayla kendi kendine evrim protokolü eklendi |

## Lisans

MIT. Bkz. [LICENSE](LICENSE).

## İşaretçiler

- [PLUGIN_INSTALL.md](PLUGIN_INSTALL.md) — ajan başına tam kurulum matrisi (Claude Code, Codex, OpenCode, Copilot, manuel)
- [CONTRIBUTING.md](CONTRIBUTING.md) — bir skill'i nasıl ekleyebilir veya değiştirebilirsiniz
- [LICENSE](LICENSE) — MIT
- [SECURITY.md](SECURITY.md) — bir güvenlik sorununu nasıl bildirebilirsiniz
- [CITATION.cff](CITATION.cff) — bu koleksiyona nasıl atıfta bulunulur
- [.github/workflows/lint-skills.yml](.github/workflows/lint-skills.yml) — her skill'i lint eden CI
- [scripts/lint-all.sh](scripts/lint-all.sh) — yerel eşdeğeri
- [.claude-plugin/marketplace.json](.claude-plugin/marketplace.json) — Claude Code eklenti manifestosu
- [.codex-plugin/plugin.json](.codex-plugin/plugin.json) — Codex eklenti manifestosu

---

Titizlik + delegasyon + 7 maddelik bir anayasa ile inşa edildi.
Faydalı bulduysanız yıldız verin.
