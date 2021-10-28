Vim�UnDo� ��mX`���'wZ�jY���(�ʈ"�~�`  %                                   ay�	     _�                      6        ����                                                                                                                                                                                                                                                                                                                                                             ay�     �              %    import {useEffect} from 'react';   2import {GetServerSideProps, NextPage} from 'next';   ?import {getHeader, getFooter, getSocial} from '../src/queries';   &import {useRecoilState} from 'recoil';   Limport {socialMenuState, navMenuState, footerMenuState} from '../src/state';   )// import {useRecoilState} from 'recoil';   -// import {navMenuState} from '../src/state';   5// import {getPagebyUri} from '../src/queries/pages';   5// import {GetNavbarMenu} from '../src/queries/menu';   /import Head from '../src/components/core/head';   :import {Page} from '../src/components/layouts/containers';   9// import Navigation from '../src/components/Navigation';   >import {ButtonOnLeft, Hero} from '../src/components/homepage';   Oimport {Subtitle, Carousel, CardsRow, DarkBackground} from '../src/components';   ?import {LargeSpace} from '../src/components/core/space.styles';   Jimport {ScrollingSection} from '../src/components/core/scrolling-section';       !export interface IndexPageProps {     // seo: {     //   title: string;     //   description?: string;     //   image?: string;     //   keywords?: string[];     //   canonical?: string;     //   isIndexed?: boolean;     //   titleDelimiter?: string;     //   metaDesc: string;     //   focuskw: string;     //   metaKeywords: string;     //   twitterTitle: string;   "  //   twitterDescription: string;     //   cornerstone?: string;   #  //   metaRobotsNofollow?: string;   "  //   metaRobotsNoindex?: string;      //   opengraphAuthor?: string;   %  //   opengraphDescription?: string;   '  //   opengraphPublishedTime?: string;   #  //   opengraphPublisher?: string;   "  //   opengraphSiteName?: string;     //   opengraphTitle?: string;     //   opengraphType?: string;     //   readingTime?: string;     //   opengraphUrl?: string;     //   twitterImage?: {     //     sourceUrl?: string;     //     altText?: string;   	  //   };     //   opengraphImage?: {     //     sourceUrl?: string;     //     altText?: string;   	  //   };     // };     message?: string;     wpMenus?: {       navigation?: any;       footer?: any;       social?: any;       ctas?: any;     };   }       8const Index: NextPage<IndexPageProps> = ({wpMenus}) => {   8  const [_menu, setMenu] = useRecoilState(navMenuState);   ?  const [_footer, setFooter] = useRecoilState(footerMenuState);   ?  const [_social, setSocial] = useRecoilState(socialMenuState);         useEffect(() => {   !    setMenu(wpMenus?.navigation);       setFooter(wpMenus?.footer);       setSocial(wpMenus?.social);   	  }, []);       
  return (   
    <Page>         <Head title="Home" />         <Hero />   :      <Subtitle>Infuse data everywhere you work</Subtitle>         <Carousel           sections={[             {   ,            title: 'Simplify data analysis',               description:   c              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean lectus nulla arcu.',   <            imageSrc: 'images/homepage/carousel/image1.png',             },             {   2            title: 'Build customized experiences',               description:   c              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean lectus nulla arcu.',   <            imageSrc: 'images/homepage/carousel/image2.png',             },             {   *            title: 'Evolve your business',               description:   c              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean lectus nulla arcu.',   <            imageSrc: 'images/homepage/carousel/image3.png',             },   
        ]}         />   3      <ButtonOnLeft>Discover Sisense</ButtonOnLeft>         <LargeSpace />   A      <Subtitle>One platform, three powerful solutions</Subtitle>         <CardsRow           cards={[             {   $            title: 'Sisense Fusion',   :            imageSrc: 'images/homepage/3-cards/icon1.png',               category: 'Embed',               text:   �              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean lectus nulla arcu. Lorem ipsum dolor sit amet, consectetur adipiscing elit.',   5            linkText: 'Explore Sisense Fusion Embed',   *            linkUrl: 'https://google.com',             },             {   $            title: 'Sisense Fusion',   :            imageSrc: 'images/homepage/3-cards/icon2.png',   "            category: 'Analytics',               text:   �              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean lectus nulla arcu. Lorem ipsum dolor sit amet, consectetur adipiscing elit.',   5            linkText: 'Explore Sisense Fusion Embed',   *            linkUrl: 'https://google.com',             },             {   $            title: 'Sisense Fusion',   :            imageSrc: 'images/homepage/3-cards/icon3.png',               category: 'Cloud',               text:   �              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean lectus nulla arcu. Lorem ipsum dolor sit amet, consectetur adipiscing elit.',   5            linkText: 'Explore Sisense Fusion Embed',   *            linkUrl: 'https://google.com',             },   
        ]}         />         <LargeSpace />         <DarkBackground>           <LargeSpace />           <Carousel             inverted             dark             sections={[               {   .              title: 'Simplify data analysis',                 description:   e                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean lectus nulla arcu.',   >              imageSrc: 'images/homepage/carousel/image4.png',   .              linkText: 'Learn more about AI',   ,              linkUrl: 'https://google.com',               },               {   4              title: 'Build customized experiences',                 description:   e                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean lectus nulla arcu.',   >              imageSrc: 'images/homepage/carousel/image5.png',   .              linkText: 'Learn more about AI',   ,              linkUrl: 'https://google.com',               },               {   ,              title: 'Evolve your business',                 description:   e                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean lectus nulla arcu.',   >              imageSrc: 'images/homepage/carousel/image6.png',   .              linkText: 'Learn more about AI',   ,              linkUrl: 'https://google.com',               },             ]}   
        />           <LargeSpace />           <ScrollingSection             rows={[               {   0              title: 'Solutions for any team 1',                 text:   t                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Iaculis mauris lorem cras massa aliquet.',   >              linkText: 'See how Sisense fits into your team',   ,              linkUrl: 'https://google.com',                 card: {   >                imageSrc: 'images/homepage/3-cards/icon1.png',   $                title: 'Technology',                   text:   v                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Iaculis mauris lorem cras massa aliquet.',                 },               },               {   0              title: 'Solutions for any team 2',                 text:   t                'Iaculis mauris lorem cras massa aliquet. Lorem ipsum dolor sit amet, consectetur adipiscing elit.',   >              linkText: 'See how Sisense fits into your team',   ,              linkUrl: 'https://google.com',                 card: {   >                imageSrc: 'images/homepage/3-cards/icon1.png',   $                title: 'Technology',                   text:   v                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Iaculis mauris lorem cras massa aliquet.',                 },               },               {   0              title: 'Solutions for any team 3',                 text:   t                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Iaculis mauris lorem cras massa aliquet.',   >              linkText: 'See how Sisense fits into your team',   ,              linkUrl: 'https://google.com',                 card: {   >                imageSrc: 'images/homepage/3-cards/icon1.png',   $                title: 'Technology',                   text:   v                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Iaculis mauris lorem cras massa aliquet.',                 },               },               {   0              title: 'Solutions for any team 4',                 text:   t                'Iaculis mauris lorem cras massa aliquet. Lorem ipsum dolor sit amet, consectetur adipiscing elit.',   >              linkText: 'See how Sisense fits into your team',   ,              linkUrl: 'https://google.com',                 card: {   >                imageSrc: 'images/homepage/3-cards/icon1.png',   $                title: 'Technology',                   text:   v                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Iaculis mauris lorem cras massa aliquet.',                 },               },               {   0              title: 'Solutions for any team 5',                 text:   t                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Iaculis mauris lorem cras massa aliquet.',   >              linkText: 'See how Sisense fits into your team',   ,              linkUrl: 'https://google.com',                 card: {   >                imageSrc: 'images/homepage/3-cards/icon1.png',   $                title: 'Technology',                   text:   v                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Iaculis mauris lorem cras massa aliquet.',                 },               },               {   0              title: 'Solutions for any team 6',                 text:   t                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Iaculis mauris lorem cras massa aliquet.',   >              linkText: 'See how Sisense fits into your team',   ,              linkUrl: 'https://google.com',                 card: {   >                imageSrc: 'images/homepage/3-cards/icon1.png',   $                title: 'Technology',                   text:   v                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Iaculis mauris lorem cras massa aliquet.',                 },               },             ]}   
        />         </DarkBackground>       </Page>     );   };       Cexport const getServerSideProps: GetServerSideProps = async () => {   "  // const {slug} = context.query;     // const {     //   data: {pageBy},   (  // } = await getPagebyUri(slug || '');   ,  // const errorCode = pageBy ? false : 404;         // if (errorCode) {   *  //   context.res.statusCode = errorCode;     //   return {     //     notFound: true,   	  //   };     // }         const newContext = {       props: {         // uri: pageBy.uri,         // seo: pageBy.seo,   #      // settings: pageBy.settings,   *      // sections: pageBy.sections.layout,         // title: pageBy.title,         // errorCode,         wpMenus: {},       },     };       ?  const menuPromises = [getHeader(), getFooter(), getSocial()];   G  const [navigation, footer, social] = await Promise.all(menuPromises);         newContext.props.wpMenus = {   :    navigation: navigation?.data?.menus?.nodes?.[0] || [],   2    footer: footer?.data?.menus?.nodes?.[0] || [],   2    social: social?.data?.menus?.nodes?.[0] || [],     };         return newContext;   };       export default Index;5�5��