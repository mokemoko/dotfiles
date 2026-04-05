#!/usr/bin/env python3
"""Status line: progress bar with gradient + time-to-reset display"""
import json, sys, time
if sys.platform == 'win32':
    sys.stdout.reconfigure(encoding='utf-8')

data = json.load(sys.stdin)

BLOCKS = ' ▏▎▍▌▋▊▉█'
R    = '\033[0m'
BOLD = '\033[1m'
DIM  = '\033[2m'
# 視認性の高い白系（残り時間表示用）
WHITE  = '\033[38;2;220;220;220m'
SEP    = f'{DIM}│{R}'

def gradient(pct):
    """使用率に応じて緑→黄→赤のグラデーション（通常輝度）"""
    if pct < 50:
        r = int(pct * 5.1)
        return f'\033[38;2;{r};210;90m'
    else:
        g = int(210 - (pct - 50) * 4.2)
        return f'\033[38;2;255;{max(g, 0)};60m'

def bar(pct, width=8):
    pct = min(max(pct, 0), 100)
    filled = pct * width / 100
    full = int(filled)
    frac = int((filled - full) * 8)
    b = '█' * full
    if full < width:
        b += BLOCKS[frac]
        b += '░' * (width - full - 1)
    return b

def fmt_remaining(resets_at):
    """Unix epoch からリセットまでの残り時間を短縮表記で返す"""
    secs = max(0, int(resets_at - time.time()))
    m, s = divmod(secs, 60)
    h, m = divmod(m, 60)
    d, h = divmod(h, 24)
    if d > 0:
        return f'{d}d{h}h'
    elif h > 0:
        return f'{h}h{m:02d}m'
    else:
        return f'{m}m'

def fmt_limit(label, pct, resets_at=None):
    p = round(pct)
    color = gradient(pct)
    b = f'{color}{bar(pct)}{R}'
    pct_str = f'{color}{BOLD}{p}%{R}'
    result = f'{label} {b} {pct_str}'
    if resets_at is not None:
        remaining = fmt_remaining(resets_at)
        result += f' {WHITE}{remaining}{R}'
    return result

model = data.get('model', {}).get('display_name', 'Claude')
parts = [f'{BOLD}{model}{R}']

ctx = data.get('context_window', {}).get('used_percentage')
if ctx is not None:
    color = gradient(ctx)
    p = round(ctx)
    parts.append(f'ctx {color}{bar(ctx)}{R} {color}{BOLD}{p}%{R}')

rl = data.get('rate_limits', {})

five_info = rl.get('five_hour')
if five_info:
    pct = five_info.get('used_percentage')
    resets_at = five_info.get('resets_at')
    if pct is not None:
        parts.append(fmt_limit('5h', pct, resets_at))

week_info = rl.get('seven_day')
if week_info:
    pct = week_info.get('used_percentage')
    resets_at = week_info.get('resets_at')
    if pct is not None:
        parts.append(fmt_limit('7d', pct, resets_at))

print(SEP.join(f' {p} ' for p in parts), end='')

