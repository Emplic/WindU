import defaultComponents from "fumadocs-ui/mdx";
import { Tabs, Tab } from "fumadocs-ui/components/tabs";
import type { MDXComponents } from "mdx/types";
import { CodeBlock, Pre } from "fumadocs-ui/components/codeblock";

function asset(src: string) {
    if (/^https?:\/\//.test(src)) return src;
    const encoded = src
        .split("/")
        .map((part, index) => (index === 0 ? part : encodeURIComponent(part)))
        .join("/");
    return `${process.env.NEXT_PUBLIC_BASE_PATH || ""}${encoded}`;
}

export function getMDXComponents(components?: MDXComponents): MDXComponents {
    return {
        ...defaultComponents,
        pre: ({ ref: _ref, ...props }) => (
            <CodeBlock {...props}>
                <Pre>{props.children}</Pre>
            </CodeBlock>
        ),
        img: ({ src, ...props }) => {
            const source =
                typeof src === "string" && src.startsWith("/")
                    ? asset(src)
                    : src;

            return <img src={source} loading="lazy" {...props} />;
        },
        Tabs,
        Tab,
        ...components,
    };
}
