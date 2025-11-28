# eBUS Demo v2 - AI Features Implementation Plan

## 📁 Fájl: `demo-v2-ai.html`

Ez a fájl tartalmazza az AI-powered funkciókat a demo-ban. Később egyesítjük a `demo.html`-lel.

---

## 🎯 Implementált Funkciók

### **PHASE 1: Admin - Data Sources Dashboard** ✅

#### Data Sources Oldal (`adminPage === 'datasources'`)

**Layout:**
```
┌─ Data Sources ───────────────────────────────────────────┐
│ 🔗 External Data Sources (12 connected, 1 pending, 1 failed) │
│ [+ Add New Source]                                        │
│                                                            │
│ ┌─ OEM Telemetry ─────────────────────────────────────┐  │
│ │ ✅ Mercedes eSConnect      Last sync: 2 min ago     │  │
│ │    98% quality • 24 vehicles • 247 AI queries       │  │
│ │                                                      │  │
│ │ ✅ Solaris eSConnect       Last sync: 5 min ago     │  │
│ │    95% quality • 12 vehicles • 183 AI queries       │  │
│ │                                                      │  │
│ │ ⚠️  MAN Now API             Pending auth             │  │
│ │    0% quality • 0 vehicles • 0 AI queries           │  │
│ │                                                      │  │
│ │ ✅ BYD Fleet               Last sync: 8 min ago     │  │
│ │    92% quality • 6 vehicles • 95 AI queries         │  │
│ └──────────────────────────────────────────────────────┘  │
│                                                            │
│ ┌─ FMS Providers ─────────────────────────────────────┐  │
│ │ ✅ ViriCiti                Last sync: 1 min ago     │  │
│ │    99% quality • 42 vehicles • 512 AI queries       │  │
│ │                                                      │  │
│ │ ✅ INIT/HanseCom           Last sync: 3 min ago     │  │
│ │    97% quality • 42 vehicles • 421 AI queries       │  │
│ │                                                      │  │
│ │ ❌ Optibus                 Connection failed         │  │
│ │    45% quality • 0 vehicles • 23 AI queries         │  │
│ │                                                      │  │
│ │ ✅ SWARCO                  Last sync: 12 min ago    │  │
│ │    94% quality • 42 vehicles • 287 AI queries       │  │
│ └──────────────────────────────────────────────────────┘  │
│                                                            │
│ ┌─ External APIs ─────────────────────────────────────┐  │
│ │ ✅ OpenWeatherMap          Last sync: 10 min ago    │  │
│ │ ✅ EU CVD Compliance DB    Last sync: 1 day ago     │  │
│ │ ✅ Market Intelligence     Last sync: 6 hours ago   │  │
│ └──────────────────────────────────────────────────────┘  │
│                                                            │
│ ┌─ Charging Networks ─────────────────────────────────┐  │
│ │ ✅ ChargePoint Network     Last sync: 4 min ago     │  │
│ │ ✅ ABB Chargers            Last sync: 7 min ago     │  │
│ │ ✅ Heliox OCPP             Last sync: 15 min ago    │  │
│ └──────────────────────────────────────────────────────┘  │
└────────────────────────────────────────────────────────────┘
```

**Features:**
- Status badges: Connected (green), Pending (yellow), Failed (red)
- Click on card → Detail modal megnyílik
- Real-time sync status simulation
- AI query usage tracking per source

**Detail Modal:**
```
┌─ Mercedes eSConnect Details ─────────────────────────────┐
│ [✕]                                                       │
│                                                            │
│ Connection Details                                         │
│ • API Endpoint: https://api.mercedes-esconnect.com/v2     │
│ • Authentication: OAuth 2.0                               │
│ • Status: Connected ✅                                     │
│ • Last Sync: 2 minutes ago                                │
│                                                            │
│ Data Quality: 98%                                         │
│ [████████████████████░░] 98%                              │
│                                                            │
│ Vehicles Connected: 24                                     │
│ AI Queries (Last 30 days): 247                            │
│                                                            │
│ Recent Sync History                                        │
│ ┌─────────────────────────────────────────────────────┐  │
│ │ 2024-11-27 15:42  Success  1,247 records            │  │
│ │ 2024-11-27 15:40  Success  1,251 records            │  │
│ │ 2024-11-27 15:38  Success  1,245 records            │  │
│ └─────────────────────────────────────────────────────┘  │
│                                                            │
│ [Sync Now] [Configure] [Disconnect]                       │
└────────────────────────────────────────────────────────────┘
```

---

### **PHASE 2: Admin - AI Configuration** ✅

#### AI Config Oldal (`adminPage === 'aiconfig'`)

```
┌─ AI Analysis Engine Configuration ───────────────────────┐
│                                                            │
│ Model Settings                                             │
│ ┌────────────────────────────────────────────────────┐   │
│ │ AI Model: [GPT-4 ▼]                                │   │
│ │   Options: GPT-4, GPT-3.5, Claude 3, Gemini       │   │
│ │                                                     │   │
│ │ Temperature: [0.7] ────●───────── (0.0 - 1.0)     │   │
│ │   Lower = More focused, Higher = More creative     │   │
│ │                                                     │   │
│ │ Max Response Length: [500 tokens ▼]               │   │
│ │   Options: 250, 500, 1000, 2000                   │   │
│ │                                                     │   │
│ │ Response Style: [Professional ▼]                  │   │
│ │   Options: Professional, Technical, Simple         │   │
│ │                                                     │   │
│ │ ☑️ Enable Streaming Responses                      │   │
│ │ ☑️ Enable Chart Generation                         │   │
│ │ ☑️ Enable Multi-language Support                   │   │
│ └────────────────────────────────────────────────────┘   │
│                                                            │
│ Data Source Priorities (Drag to reorder)                  │
│ ┌────────────────────────────────────────────────────┐   │
│ │ 🥇 Market Benchmarks       [Critical Priority]     │   │
│ │ 🥈 OEM Telemetry           [High Priority]         │   │
│ │ 🥉 FMS Data                [High Priority]         │   │
│ │ 🏅 Weather Data            [Medium Priority]       │   │
│ │ 🎖️  Charging Networks       [Medium Priority]       │   │
│ │ 🏆 CVD Compliance          [Low Priority]          │   │
│ └────────────────────────────────────────────────────┘   │
│                                                            │
│ Analysis Types Enabled                                     │
│ ┌────────────────────────────────────────────────────┐   │
│ │ ☑️ Predictive Maintenance                          │   │
│ │    ML-based predictions for battery & components   │   │
│ │                                                     │   │
│ │ ☑️ Performance Benchmarking                        │   │
│ │    Compare fleet vs industry standards            │   │
│ │                                                     │   │
│ │ ☑️ Cost Optimization                               │   │
│ │    Energy cost & charging schedule optimization   │   │
│ │                                                     │   │
│ │ ☑️ Compliance Checking                             │   │
│ │    CVD compliance automation & reporting          │   │
│ │                                                     │   │
│ │ ☑️ Root Cause Analysis                             │   │
│ │    Diagnose performance issues & anomalies        │   │
│ └────────────────────────────────────────────────────┘   │
│                                                            │
│ [Save Configuration] [Test AI →] [Reset to Default]       │
└────────────────────────────────────────────────────────────┘
```

**Test AI Modal:**
```
┌─ Test AI Response ────────────────────────────────────────┐
│                                                            │
│ Enter a test query:                                        │
│ ┌────────────────────────────────────────────────────┐   │
│ │ Why did efficiency drop 12% last week?             │   │
│ └────────────────────────────────────────────────────┘   │
│                                                            │
│ [Test Query]                                               │
│                                                            │
│ 🤖 AI Response (1.8s):                                    │
│ ┌────────────────────────────────────────────────────┐   │
│ │ Based on analysis of 4 data sources:               │   │
│ │ ✓ ViriCiti telemetry data                          │   │
│ │ ✓ OpenWeatherMap (last 7 days)                     │   │
│ │ ✓ Route profiles                                   │   │
│ │ ✓ Benchmark database                               │   │
│ │                                                     │   │
│ │ The 12% efficiency drop is attributed to:          │   │
│ │ 1. Temperature decrease (-8°C avg, +25% heating)   │   │
│ │ 2. Route 5 traffic increase (15% longer trips)     │   │
│ │ 3. Battery degradation on 3 vehicles (avg -2% SoH) │   │
│ │                                                     │   │
│ │ Recommendations:                                    │   │
│ │ • Optimize cabin heating strategy (save 8%)        │   │
│ │ • Consider battery health check for BUS-004        │   │
│ │ • Benchmark: Similar fleets show 1.25 kWh/km       │   │
│ └────────────────────────────────────────────────────┘   │
│                                                            │
│ [Close]                                                    │
└────────────────────────────────────────────────────────────┘
```

**AI Analytics Dashboard (below config):**
```
AI Usage Statistics (Last 30 Days)

┌─────────────┬─────────────┬─────────────┬─────────────┐
│ Total       │ Avg Response│ User        │ Most Used   │
│ Queries     │ Time        │ Satisfaction│ Analysis    │
├─────────────┼─────────────┼─────────────┼─────────────┤
│   2,347     │    1.8s     │    94%      │ Predictive  │
│   +12%      │    -0.2s    │    +3%      │    (35%)    │
└─────────────┴─────────────┴─────────────┴─────────────┘

Top 10 Questions (Bar Chart)
┌──────────────────────────────────────────────────────┐
│ "Battery degradation prediction"     ████████████ 247│
│ "Efficiency drop analysis"           ██████████ 183  │
│ "Cost optimization tips"             ████████ 156    │
│ "CVD compliance status"              ██████ 134      │
│ "Route performance comparison"       █████ 112       │
│ ...                                                   │
└──────────────────────────────────────────────────────┘
```

---

### **PHASE 3: Portal - AI Insights Cards** ✅

Dashboard tetején (Analytics Overview):

```
┌─ 🤖 AI Fleet Insights ─────────────────────────────────┐
│                                                         │
│ ⚠️ Predictive Maintenance Alert                        │
│ 3 buses predicted to reach 80% SoH within 6 months    │
│ Affected: BUS-247, BUS-312, BUS-089                    │
│ [View Details →] [Schedule Maintenance]                │
│                                                         │
│ 💰 Cost Optimization Opportunity                       │
│ Shift 40% of charging to off-peak hours               │
│ Potential savings: €12,400/year                        │
│ [See Charging Plan →]                                  │
│                                                         │
│ 📊 Benchmark Insight                                   │
│ Your fleet efficiency: Top 15% in EU                   │
│ 1.18 kWh/km vs 1.32 kWh/km industry average           │
│ [Compare with Peers →]                                 │
│                                                         │
│ 🔋 Battery Health Alert                                │
│ BUS-004 showing accelerated degradation              │
│ Current: 78% SoH (7% below benchmark)                 │
│ [Investigate →]                                        │
│                                                         │
│ [💬 Ask AI for More Insights...]                       │
└─────────────────────────────────────────────────────────┘
```

**Auto-rotation:** Insights váltakoznak 3-4 másodpercenként

---

### **PHASE 4: Portal - AI Chat Interface** ✅

**Floating Chat Button:**
- Jobb alsó sarok
- Icon: 🤖 vagy 💬
- Badge: "Ask AI"
- Click → Side panel megnyílik

**Chat Panel:**
```
┌─ AI Fleet Analyst ──────────────────────────────────────┐
│ 🤖 eBUS AI                                  [✕ Close]   │
├─────────────────────────────────────────────────────────┤
│                                                          │
│ 👋 Hi! I'm your AI fleet analyst.                      │
│    Ask me anything about your fleet performance.        │
│                                                          │
│ 💡 Try asking:                                          │
│ • "Why did efficiency drop last week?"                 │
│ • "Which buses need maintenance soon?"                 │
│ • "Compare my fleet to industry average"               │
│ • "Predict battery health for next 6 months"           │
│                                                          │
│ ┌────────────────────────────────────────────────────┐ │
│ │ [Conversation scrollable area]                     │ │
│ │                                                     │ │
│ │ [User] Why is BUS-247 consuming more energy?      │ │
│ │                                                     │ │
│ │ [AI] 🤔 Analyzing...                               │ │
│ │ ✓ Telemetry (ViriCiti)                            │ │
│ │ ✓ Weather (last 7 days)                           │ │
│ │ ✓ Route profile                                   │ │
│ │ ✓ Benchmarks                                      │ │
│ │                                                     │ │
│ │ [AI] Based on analysis:                            │ │
│ │                                                     │ │
│ │ BUS-247 shows 18% higher consumption due to:      │ │
│ │ 1. Route change (15% more elevation gain)         │ │
│ │ 2. Colder temps (-3°C avg, heating intensive)     │ │
│ │ 3. Battery degradation (91.2% SoH, down 2%)       │ │
│ │                                                     │ │
│ │ Recommendations:                                   │ │
│ │ • Battery health check in 3 months                │ │
│ │ • Optimize heating (save 8% energy)               │ │
│ │ • Benchmark: 1.25 kWh/km for similar routes       │ │
│ │                                                     │ │
│ │ [📊 Show Detailed Chart →]                         │ │
│ │                                                     │ │
│ │ You might also ask:                                │ │
│ │ • "Show BUS-247 efficiency trend"                 │ │
│ │ • "Compare to similar vehicles"                   │ │
│ └────────────────────────────────────────────────────┘ │
│                                                          │
│ [Type your question...]                     [Send →]    │
│                                                          │
│ Powered by eBUS AI Engine v2.0                          │
└──────────────────────────────────────────────────────────┘
```

**Mock AI Response Logic (15-20 pre-written responses):**

1. **Battery queries** → SoH prediction, degradation analysis
2. **Efficiency queries** → Root cause, weather impact, route analysis
3. **Cost queries** → Charging optimization, energy savings
4. **Benchmark queries** → Industry comparison, peer ranking
5. **Maintenance queries** → Predictive alerts, scheduling
6. **Compliance queries** → CVD status, reporting
7. **Route queries** → Performance by route, optimization
8. **Generic fallback** → "Let me check the relevant dashboards..."

---

## 🗂️ Data Structures (Mock)

### AI Insights Mock
```javascript
const aiInsights = [
  {
    type: 'maintenance',
    severity: 'warning',
    icon: 'fas fa-wrench',
    title: 'Predictive Maintenance Alert',
    description: '3 buses predicted to reach 80% SoH within 6 months',
    details: {
      vehicles: ['BUS-247', 'BUS-312', 'BUS-089'],
      timeframe: '6 months',
      confidence: 0.87
    },
    actions: [
      { label: 'View Details', action: 'showDetails' },
      { label: 'Schedule Maintenance', action: 'schedule' }
    ]
  },
  // ... more insights
];
```

### AI Chat Responses Mock
```javascript
const aiChatResponses = {
  battery: {
    keywords: ['battery', 'soh', 'degradation', 'health'],
    response: `Based on analysis of your fleet:

Current fleet average SoH: 92%
Industry benchmark: 85% (+7% better)

Critical attention needed:
• BUS-004: 78% SoH (1.2%/month degradation)
• BUS-012: 82% SoH (watch for trends)

Predictions:
• 3 vehicles will reach 80% SoH within 6 months
• Estimated battery replacement: 2026 Q3

Recommendations:
• Schedule battery health check for BUS-004
• Monitor charging patterns (avoid 100% charges)
• Benchmark: Top fleets maintain 90%+ SoH`,
    dataSources: ['ViriCiti', 'OEM Telemetry', 'Benchmark DB'],
    responseTime: 1.8,
    charts: ['soh-trend', 'degradation-forecast']
  },
  // ... 15-20 more response templates
};
```

---

## 🎨 Styling

### AI Branding
- **Primary color**: Purple gradient (`#8b5cf6` → `#6366f1`)
- **Icon**: 🤖 (robot emoji) vagy `fas fa-robot`
- **Accent**: Subtle purple glow on AI elements

### Animations
- Chat panel slide-in from right (300ms ease)
- Typing indicator: 3 dots bouncing
- Insight cards: Fade-in on load (stagger 100ms)
- AI "thinking" shimmer effect

---

## 📦 File Structure

```
demo-v2-ai.html
├─ HTML Structure (same as demo.html)
├─ Admin View Extensions
│  ├─ Data Sources page (new)
│  └─ AI Configuration page (new)
├─ Portal View Extensions
│  ├─ AI Insights Cards (on dashboard)
│  └─ AI Chat Panel (floating)
├─ JavaScript Additions
│  ├─ dataSources array
│  ├─ aiInsights array
│  ├─ aiChatResponses object
│  ├─ AI chat logic (keyword matching)
│  └─ Modal handlers (data source detail, test AI)
└─ CSS Additions
   ├─ AI purple theme
   ├─ Chat animations
   └─ Shimmer effects
```

---

## ✅ Implementation Checklist

- [x] Admin menu extended (Data Sources, AI Config)
- [x] Mock data structures created
- [ ] Data Sources page HTML
- [ ] Data Source detail modal
- [ ] AI Configuration page HTML
- [ ] Test AI modal
- [ ] AI Analytics dashboard
- [ ] Portal AI Insights cards (dashboard)
- [ ] AI Chat floating button
- [ ] AI Chat panel UI
- [ ] AI Chat response logic (15-20 templates)
- [ ] Animations & polish
- [ ] Mobile responsiveness

---

## 🔄 Integration Plan

Once demo-v2-ai.html is complete:
1. Test all AI features independently
2. Copy AI sections to demo.html
3. Merge data structures
4. Test integration
5. Deploy to GitHub Pages

---

*Created: 2024-11-27*
*Status: In Progress - Separate file approach*
