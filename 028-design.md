# Docling AI Design System and UI/UX Standard

## Purpose
The Command Center uses a restrained enterprise visual system: neutral surfaces, a single primary brand accent, semantic status colors, clear hierarchy, keyboard access, responsive layout, and tokenized spacing/radius/typography. It is inspired by public Fluent 2 and Material design principles without claiming affiliation or copying proprietary product UI.

## Core tokens
- Brand/Azure-style blue: `#0078D4`
- Information/Google blue: `#4285F4`
- Success/Google green: `#34A853`
- Warning/Google yellow: `#FBBC05`
- Critical/Google red: `#EA4335`
- Text primary: `#1F1F1F`
- Text secondary: `#5F6368`
- Surface: `#FFFFFF`
- Canvas: `#F5F7FA`
- Border: `#E0E3E7`
- Dark surface: `#171717`

Semantic colors are never the only status indicator; pair icon + label + color.

## Interaction standard
- logical heading hierarchy
- visible keyboard focus
- all primary controls reachable by keyboard
- minimum readable contrast targets aligned to WCAG AA
- responsive down to narrow screens
- no remote fonts, CDN JavaScript, analytics, trackers, or external UI dependencies
- dark/light theme through local CSS variables
- local-only icons implemented with Unicode/SVG-like CSS primitives until an approved icon package is vendored

## Command Center information architecture
Overview | Add Documents | Queue | Library | Search | AI Chat | Deep Analysis | Create | Exceptions | Sessions | Audit | Health | Backup | Models | Settings

## Dashboard
Top bar: product, deployment edition, health, model, theme.
Left rail: navigation.
Main: KPI cards, processing pipeline, recent files, open exceptions, search/chat workspace.
Right evidence panel: citations, source coordinates, model/retrieval metadata.

## Status language
PASS / HEALTHY / SUCCESS
WARN / DEGRADED / PARTIAL / PENDING_REVIEW
FAIL / CRITICAL / FAILED / ENCRYPTED / UNSUPPORTED
INFO / DISCOVERED / DUPLICATE / INTENTIONALLY_EXCLUDED
